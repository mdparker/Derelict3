#Derelict 3

Consider the current repo an ALPHA version! If you don't know what Derelict is, see the old project page for info on Derelict 1 & 2:

http://www.dsource.org/projects/derelict/

And visit the forum for help:

http://www.dsource.org/forums/viewforum.php?f=19

This is a quick & dirty intro until I get the time to put together proper documentation. Several things have changed from Derelict 2.

The first thing to notice is that all source modules are located under a single import tree. When you build, .di files are no longer generated. So when building your app, you can just put the 'import' folder on the compiler's import path and away you go.

Second, Derelict is now D2 only. You should still be able to use Tango with Derelict via the recently announced D2 port. But if you need D1, go back to Derelict 2.

Third, the build process has changed. No more makefiles. I hate them with a passion. The decision to support D2-only made it practical to slap together a simple build script. You can specify which packages to build, or specify none to build all. You can run it with rdmd like so:

```
cd $Derelict/build
rdmd derelict.d

rdmd derelict.d DerelictUtil DerelictGL3
```

Or, if you prefer (as I do), you can compile it once with your D2 compiler (DMD, GDC, or LDC2) and execute it as often as you need to. You'll only need to recompile the build script if you pull down any changes to it from the repository.

```
cd $Derelict/build
dmd derelict.d

# Build all Derelict packages
derelict

# Build specific packages.
derelict DerelictUtil DerelictGL3
```

Also, be aware that the paths are currently hardcoded such that if you execute the script from another working directory, it will fail. I'll make it more robust in the future.

#DerelictGL3

The interface to DerelictGL3 is a bit different from the old DerelictGL. The primary change is that none of the symbols deprecated in the modern OpenGL specifications are present. This binding is based solely on the C header, gl3.h. You can still use older versions of OpenGL, but none of the deprecated functions will be loaded.

Here's what you need to do in order to get up and running.

Using a third party lib (like GLFW 3, for which you can use DerelictGLFW3 in this repo):
```d
// One import -- this pulls in all OpenGL core 1.1 - 4.2
// functions & types as well as the ARB extensions.
import derelict.opengl3.gl3;

// Use GLFW 3 to create a forward-compatible core context
import derelict.glfw3.glfw3;

void someFunc()
{

// Load the OpenGL library and all functions up to OpenGL 1.1
DerelictGL3.load();

// Create your (preferably forward-compatible) OpenGL context
...

// Now load OpenGL versions 1.2 & higher as well as ARB extensions
// Note that no platform-specific extensions and no extensions
// other than ARB are implemented at the moment.
GLVersion glver = DerelictGL3.reload();

// If you need a specific version, like OpenGL3.3 for example
if(glver < GLVersion.GL33)
    throw new Exception("OpenGL version too low.");

// Or use the loadedVersion property
if(DerelictGL3.loadedVersion < GLVersion.GL33)
    ...

// To test if an extenstion is loaded, just use the extension name as a bool value
if(!ARB_sync)
   throw new Exception("No ARB_sync extension!");

}
```

You should call reload anytime you change contexts. This is required on Windows, but not on other platforms. There's a little bit more to do if you want to create a context yourself, but there's no support for that right now as I haven't yet implemented the WGL extensions.

#DerelictFreeGLUT

This is a binding to [freeglut 2.8.0](http://freeglut.sourceforge.net/). It is largely complete,
however it's missing the types for the font stuff. In the C headers, the font types are declared
in a manner that I find a bit confusing. I need to dig into it a bit more to figure out exactly
how to implement in ont he D side.

#Downloads

On the [download page](https://github.com/aldacron/Derelict3/downloads), you'll find precompiled Windows DLLs for SDL2 and SDL2_image, since they aren't quite so easy to for some people to compile.

#Finally

Please bear in mind that this is all in an ALPHA state. It's perfectly usable as is, but there needs to be more work done on the build script, testing on different platforms/compilers, and, of course, the addition of a few more packages. Pull requests for bugfixes and enhancements are extremely welcome. However, I make no promises about accepting pull requests that add new packages. I'll have to take a wait-and-see approach on that for now.