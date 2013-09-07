/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module build;

import std.path : dirName, buildNormalizedPath;
import std.stdio : writefln, writeln;
import std.process : system, ErrnoException;
import std.file : dirEntries, SpanMode;
import std.array : endsWith;
import std.string : format, toUpper, capitalize;
import std.exception : enforce;

enum MajorVersion = "3";
enum MinorVersion = "0";
enum BumpVersion  = "0";
enum FullVersion  = MajorVersion ~"."~ MinorVersion ~"."~ BumpVersion;

version(DigitalMars) {
    enum DMD = true;
    enum GDC = false;
    enum LDC = false;
}
else version(GNU) {
    enum DMD = false;
    enum GDC = true;
    enum LDC = false;
}
else version(LDC) {
    enum DMD = false;
    enum GDC = false;
    enum LDC = true;
}

version(Windows) {
    enum Windows = true;
    enum Posix = false;
}
else version(Posix) {
    enum Windows = false;
    enum Posix = true;
}

static if(Windows && DMD)
{
    enum prefix = "";
    enum extension = ".lib";
}
else static if(Posix || GDC || LDC) {
    enum prefix = "lib";
    enum extension = ".a";
}
else static assert(false, "Unknown operating system and compiler.");

// Compiler configuration
version(DigitalMars)
{
    pragma(msg, "Using the Digital Mars DMD compiler.");
    enum compilerOptions = "-lib -O -release -inline -property -w -wi";
    string buildCompileString(string files, string libName)
    {
        return format("dmd %s -I%s -of%s/dmd/%s %s", compilerOptions, importPath, outdir, libName, files);
    }
}
else version(GNU)
{
    pragma(msg, "Using the GNU GDC compiler.");
    enum compilerOptions = "-c -s -O3 -Wall";
    string buildCompileString(string files, string libName)
    {
        return format("gdc %s -I%s -o %s/gdc/%s %s", compilerOptions, importPath, outdir, libName, files);
    }
}
else version(LDC)
{
    pragma(msg, "Using the LDC compiler.");
    enum compilerOptions = "-lib -O -release -enable-inlining -property -w -wi";
    string buildCompileString(string files, string libName)
    {
        return format("ldc2 %s -I%s -of%s/ldc/%s %s", compilerOptions, importPath, outdir, libName, files);
    }
}
else
{
    static assert(false, "Unknown compiler.");
}

struct Package {
    string name;
    string path;
}

enum srcDerelict = "../import/derelict/";
enum packUtil = Package( "Util", srcDerelict ~ "util/");
enum packGL3 = Package( "GL3", srcDerelict ~ "opengl3/" );
enum packGLFW3 = Package( "GLFW3", srcDerelict ~ "glfw3/" );
enum packIL = Package( "IL", srcDerelict ~ "devil/" );
enum packAL = Package( "AL", srcDerelict ~ "openal/" );
enum packALURE = Package( "ALURE", srcDerelict ~ "alure/" );
enum packFT = Package( "FT", srcDerelict ~ "freetype/" );
enum packSDL2 = Package( "SDL2", srcDerelict ~ "sdl2/" );
enum packODE = Package( "ODE", srcDerelict ~ "ode/" );
enum packASSIMP = Package( "ASSIMP", srcDerelict ~ "assimp/" );
enum packASSIMP3 = Package( "ASSIMP3", srcDerelict ~ "assimp3/" );
enum packFG = Package( "FG", srcDerelict ~ "freeglut/" );
enum packFI = Package( "FI", srcDerelict ~ "freeimage/" );
enum packSFML2 = Package( "SFML2", srcDerelict ~ "sfml2/" );
enum packLua = Package( "Lua", srcDerelict ~ "lua/" );
enum packTCOD = Package( "TCOD", srcDerelict ~ "tcod/" );
enum packOGG = Package( "OGG", srcDerelict ~ "ogg/" );
enum packPQ = Package( "PQ", srcDerelict ~ "pq/" );
enum packPFS = Package( "PhysFS", srcDerelict ~ "physfs/" );

// Map package names to source paths.
Package[string] pathMap;
string buildPath;
string importPath = "../import";
string outdir = "../lib";

static this()
{
    // Initializes the source path map.
    pathMap =
    [
        packUtil.name.toUpper() : packUtil,
        packGL3.name.toUpper() : packGL3,
        packGLFW3.name.toUpper() : packGLFW3,
        packIL.name.toUpper() : packIL,
        packAL.name.toUpper() : packAL,
        packALURE.name.toUpper() : packALURE,
        packFT.name.toUpper() : packFT,
        packSDL2.name.toUpper() : packSDL2,
        packODE.name.toUpper() : packODE,
        packASSIMP.name.toUpper() : packASSIMP,
        packASSIMP3.name.toUpper() : packASSIMP3,
        packFG.name.toUpper() : packFG,
        packFI.name.toUpper() : packFI,
        packSFML2.name.toUpper() : packSFML2,
        packLua.name.toUpper() : packLua,
        packTCOD.name.toUpper() : packTCOD,
        packOGG.name.toUpper() : packOGG,
        packPQ.name.toUpper() : packPQ,
        packPFS.name.toUpper() : packPFS
    ];
}

void main(string[] args)
{
    // Determine the path to this executable so that imports and source files can be found
    // no matter what the working directory.
    buildPath = args[0].dirName();

    if(buildPath != "./")
    {
        // Concat the build path with the import directory.
        importPath = buildNormalizedPath(buildPath, importPath);
        outdir = buildNormalizedPath(buildPath, outdir);

        // fix up the package paths
        foreach(ref pack; pathMap)
            pack.path = buildNormalizedPath(buildPath, pack.path);
    }

    if(args.length == 1)
        buildAll();
    else
        buildSome(args[1 .. $]);
}

// Build all of the Derelict libraries.
void buildAll()
{
    writeln("Building all packages.");
    try
    {
        foreach(pack; pathMap)
            buildPackage(pack);
        writeln("\nAll builds complete\n");
    }
    // Eat any ErrnoException. The compiler will print the right thing on a failed build, no need
    // to clutter the output with exception info.
    catch(ErrnoException e)
    {
        writeln("\nBuild Failed!\n");
    }
}

// Build only the packages specified on the command line.
void buildSome(string[] args)
{
    try
    {
        // If any of the args matches a key in the pathMap, build
        // that package.
        foreach(s; args)
        {
            auto key = s.toUpper();
            Package *p = key in pathMap;
            if( !p ) writefln("Unknown package '%s'", s);
            else buildPackage( *p );
        }
        writeln("\nSelected builds complete\n");
    }
    catch(ErrnoException e)
    {
        writeln("\nBuild Failed!\n");
    }
}

void buildPackage(Package pack)
{
    writefln("Building Derelict%s", pack.name);
    writeln();

    // Build up a string of all .d files in the package directory.
    string joined;
    foreach(string s; dirEntries(pack.path, SpanMode.breadth))
    {
        if(s.endsWith(".d"))
        {
            writeln(s);
            joined ~= " " ~ s;
        }
    }
    writeln();
    string libName = format("%s%s%s%s", prefix, "Derelict", pack.name, extension);
    string arg = buildCompileString(joined, libName);
    writeln(arg);

    (system(arg) == 0).enforce(new ErrnoException("Build failure"));
    writeln("Build succeeded.");
}
