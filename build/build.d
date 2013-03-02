module derelict;

import std.path : dirName;
import std.stdio : writefln, writeln;
import std.process : shell, ErrnoException;
import std.file : dirEntries, SpanMode;
import std.array : endsWith;
import std.string : format, toUpper, capitalize;

enum MajorVersion = "3";
enum MinorVersion = "0";
enum BumpVersion  = "0";
enum FullVersion  = MajorVersion ~"."~ MinorVersion ~"."~ BumpVersion;

version(Windows)
{
    enum prefix = "";
    version(Shared) enum extension = ".dll";
    else enum extension = ".lib";
}
else version(Posix)
{
    enum prefix = "lib";
    version(Shared) enum extension = ".so";
    else enum extension = ".a";
}
else
{
    static assert(false, "Unknown operating system.");
}

// Compiler configuration
version(DigitalMars)
{
    version(Shared)
        static assert(false, "Shared library support is not yet available with DMD.");

    pragma(msg, "Using the Digital Mars DMD compiler.");
    enum compilerOptions = "-lib -O -release -inline -property -w -wi";
    string buildCompileString(string files, string libName)
    {
        return format("dmd %s -I%s -of%s%s %s", compilerOptions, importPath, outdir, libName, files);
    }
}
else version(GNU)
{
    pragma(msg, "Using the GNU GDC compiler.");
    version(Shared)
        enum compilerOptions = "-s -O3 -Wall -shared";
    else
        enum compilerOptions = "-s -O3 -Wall";
    string buildCompileString(string files, string libName)
    {
        version(Shared)
            return format("gdc %s -Xlinker -soname=%s.%s -I../import -o %s%s.%s %s", compilerOptions, libName,MajorVersion, outdir, libName, FullVersion, files);
        else
            return format("gdc %s -I../import -o %s%s %s", compilerOptions, outdir, libName, files);
    }
}
else version(LDC)
{
    pragma(msg, "Using the LDC compiler.");
    version(Shared) enum compilerOptions = "-shared -O -release -enable-inlining -property -w -wi";
    else enum compilerOptions = "-lib -O -release -enable-inlining -property -w -wi";
    string buildCompileString(string files, string libName)
    {
        version(Shared)
            return format("ldc2 %s -soname=%s.%s -I../import -of%s%s.%s %s", compilerOptions, libName, MajorVersion, outdir, libName, FullVersion, files);
        else
            return format("ldc2 %s -I../import -of%s%s %s", compilerOptions, outdir, libName, files);
    }
}
else
{
    static assert(false, "Unknown compiler.");
}

// Package names
enum packUtil = "Util";
enum packGL3 = "GL3";
enum packGLFW3 = "GLFW3";
enum packIL = "IL";
enum packAL = "AL";
enum packALURE  = "ALURE";
enum packFT = "FT";
enum packSDL2 = "SDL2";
enum packODE = "ODE";
enum packASSIMP = "ASSIMP";
enum packFG = "FG";
enum packFI = "FI";
enum packSFML2 = "SFML2";
enum packLua = "Lua";
enum packTCOD = "TCOD";
enum packOGG = "OGG";
enum packPQ = "PQ";

// Source paths
enum srcDerelict = "../import/derelict/";
enum srcUtil = srcDerelict ~ "util/";
enum srcGL3 = srcDerelict ~ "opengl3/";
enum srcGLFW3  = srcDerelict ~ "glfw3/";
enum srcIL = srcDerelict ~ "devil/";
enum srcAL= srcDerelict ~ "openal/";
enum srcALURE = srcDerelict ~ "alure/";
enum srcFT = srcDerelict ~ "freetype/";
enum srcSDL2 = srcDerelict ~ "sdl2/";
enum srcODE = srcDerelict ~ "ode/";
enum srcASSIMP = srcDerelict ~ "assimp/";
enum srcFG  = srcDerelict ~ "freeglut/";
enum srcFI = srcDerelict ~ "freeimage/";
enum srcSFML2 = srcDerelict ~ "sfml2/";
enum srcLua = srcDerelict ~ "lua/";
enum srcTCOD = srcDerelict ~ "tcod/";
enum srcOGG = srcDerelict ~ "ogg/";
enum srcPQ = srcDerelict ~ "pq/";

// Map package names to source paths.
string[string] pathMap;
string buildPath;
string importPath = "../import";
string outdir = "../lib/";

static this()
{
    // Initializes the source path map.
    pathMap =
    [
        packUtil : srcUtil,
        packGL3 : srcGL3,
        packGLFW3 : srcGLFW3,
        packIL : srcIL,
        packAL : srcAL,
        packALURE : srcALURE,
        packFT : srcFT,
        packSDL2 : srcSDL2,
        packODE : srcODE,
        packASSIMP : srcASSIMP,
        packFG : srcFG,
        packFI : srcFI,
        packSFML2 : srcSFML2,
        packLua : srcLua,
        packTCOD : srcTCOD,
        packOGG : srcOGG,
        packPQ : srcPQ
    ];
}

int main(string[] args)
{
    // Determine the path to this executable so that imports and source files can be found
    // no matter what the working directory.
    buildPath = args[0].dirName() ~ "/";

    if(buildPath != "./")
    {
        // Concat the build path with the import directory.
        importPath = buildPath ~ importPath;
        outdir = buildPath ~ outdir;

        // fix up the package paths
        auto keys = pathMap.keys;
        foreach(i, s; pathMap.values)
            pathMap[keys[i]] = buildPath ~ s;
    }

    if(args.length == 1)
        buildAll();
    else
        buildSome(args[1 .. $]);

    return 0;
}

// Build all of the Derelict libraries.
void buildAll()
{
    writeln("Building all packages.");
    try
    {
        foreach(key; pathMap.keys)
            buildPackage(key);
    }
    // Eat any ErrnoException. The compiler will print the right thing on a failed build, no need
    // to clutter the output with exception info.
    catch(ErrnoException e) {}
}

// Build only the packages specified on the command line.
void buildSome(string[] args)
{
    bool buildIt(string s)
    {
        if(s in pathMap)
        {
            buildPackage(s);
            return true;
        }
        return false;
    }

    try
    {
        // If any of the args matches a key in the pathMap, build
        // that package.
        foreach(s; args)
        {
            if(!buildIt(s))
            {
                s = s.toUpper();
                if(!buildIt(s))
                {
                    s = s.capitalize();
                    if(!buildIt(s))
                        writefln("Unknown package '%s'", s);
                }
            }
        }
    }
    catch(ErrnoException e) {}
}

void buildPackage(string packageName)
{
    writefln("Building Derelict%s", packageName);
    writeln();

    // Build up a string of all .d files in the directory that maps to packageName.
    string joined;
    auto p = pathMap[packageName];
    foreach(string s; dirEntries(pathMap[packageName], SpanMode.breadth))
    {
        if(s.endsWith(".d"))
        {
            writeln(s);
            joined ~= " " ~ s;
        }
    }

    string libName = format("%s%s%s%s", prefix, "Derelict", packageName, extension);
    string arg = buildCompileString(joined, libName);

    string s = shell(arg);
    writeln(s);
    writeln("Build succeeded.");
}
