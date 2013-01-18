#Derelict 3

Consider the current repo an ALPHA version! If you don't know what Derelict is, see the old project page for info on Derelict 1 & 2:

http://www.dsource.org/projects/derelict/

And visit the forum for help:
http://dblog.aldacron.net/forum/index.php

The old forum also has a lot of information (when the site works):
http://www.dsource.org/forums/viewforum.php?f=19

This is a quick & dirty intro until I get the time to put together proper documentation. Several things have changed from Derelict 2.

The first thing to notice is that all source modules are located under a single import tree. When you build, .di files are no longer generated. So when building your app, you can just put the 'import' folder on the compiler's import path and away you go.

Second, Derelict is now D2 only. You should still be able to use Tango with Derelict via the recently announced D2 port. But if you need D1, go back to Derelict 2.

Third, the build process has changed. No more makefiles. I hate them with a passion. The decision to support D2-only made it practical to slap together a simple build script. You can specify which packages to build, or specify none to build all. You can run it with rdmd like so:

```
cd $Derelict/build
rdmd build.d

rdmd build.d Util GL3
```

Or, if you prefer (as I do), you can compile it once with your D2 compiler (DMD, GDC, or LDC2) and execute it as often as you need to. You'll only need to recompile the build script if you pull down any changes to it from the repository.

```
cd $Derelict/build
dmd build.d

# Build all Derelict packages
build

# Build specific packages.
build Util GL3

# Package names are case insensitive
build util gl3
```
Passing -version=Shared on the command line will cause the script to build the Derelict libs as shared libraries (currently, this is unsupported with DMD, but should work with both LDC and GDC).

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

// Load the OpenGL library and all functions up to OpenGL 1.1. It is not strictly
// necessary to load this before creating a context, unless you need to call some
// system-specific functions from the OpenGL shared library during context creation.
// You could call further below, just before the reload function. I prefer to load
// all of my shared libraries first so that I can fail early if they are not available.
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

Furthermore, you can also make deprecated functions and constants available like so:

```d
import derelict.opengl3.gl;

void someFunc()
{
    DerelictGL.load();

    // create classic, or compatible context

    DerelictGL.reload();
}
```

Notice that you are using the DerelictGL object, not the DerelictGL3 object in this case. You still need to link DerelictGL3.lib, as the DerelictGL stuff is compiled into the same library since it's part of the same package.

#DerelictFreeGLUT

This is a binding to [freeglut 2.8.0](http://freeglut.sourceforge.net/). It is largely complete, however it's missing the types for the font stuff. In the C headers, the font types are declared in a manner that I find a bit confusing. I need to dig into it a bit more to figure out exactly how to implement them on the D side.

#DerelictFT

This is a binding to [freetype 2.4](http://www.freetype.org/). For Windows, there are some binaries available for download from external links off the FreeType site, but those are for older versions and will not load out of the box. You'll definitely need to download and compile the latest 2.4.x version.

#DerelictTCOD

This is a binding to [libtcod 1.5.1](http://doryen.eptalys.net/libtcod/download/). Everything from libtcod is there with one major caveat. libtcod exports color structs from the shared library by value. This is no problem when linking with an import lib on windows or directly with the shared object on posix systems, but when loading manually like Derelict does it's rather problematic. libtcod provides some special functions, declared in "wrapper.h" for wrappers and bindings to work around the issue, but that means using integer values rather than the struct to represent colors. However, I chose to take a different route. DerelictTCOD loads the colors in the same way it loads the functions keep them stored as pointers. It would be possible to instead write a wrapper function that pulls the value from the pointer and copies it into the Derelict address space. But rather than do that sort of pointless duplication, I just kept them as pointers. In D, after all, you access members of a struct pointer in the same way you do a non-pointer. The only difference is that when you call one of the many TCOD_color* functions that expect a color struct to be passed by value and want to pass it one of the stock colors, you have to use the * operator on the color instance, like so:

```D
auto color = TCOD_color_subract(*TCOD_white, *TCOD_red);
```

#Downloads

On the [download page](https://github.com/aldacron/Derelict3/downloads), you'll find precompiled Windows DLLs for SDL2 and SDL2_image, since they aren't quite so easy to for some people to compile.

#Finally

Please bear in mind that this is all in an ALPHA state. It's perfectly usable as is, but there needs to be more work done on the build script, testing on different platforms/compilers, and, of course, the addition of a few more packages. Pull requests for bugfixes and enhancements are extremely welcome. However, I make no promises about accepting pull requests that add new packages. I'll have to take a wait-and-see approach on that for now.
