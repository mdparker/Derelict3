module derelict;

import std.stdio : writefln, writeln;
import std.process : shell, ErrnoException;
import std.file : dirEntries, SpanMode;
import std.array : endsWith;
import std.string : format;

// Output configuration
enum outdir = "../lib/";

version(Windows)
{
    enum prefix = "";
    enum extension = ".lib";
}
else version(Posix)
{
    enum prefix = "lib";
    enum extension = ".a";
}
else
{
    static assert(false, "Unknown operating system.");
}

// Compiler configuration
version(DigitalMars)
{
    pragma(msg, "Using the Digital Mars DMD compiler.");
    enum compilerOptions = "-lib -O -release -inline -property -w -wi";
    string buildCompileString(string files, string packageName)
    {
        return format("dmd %s -I../import -of%s%s%s%s%s", compilerOptions, outdir, prefix, packageName, extension, files);
    }
}
else version(GNU)
{
    pragma(msg, "Using the GNU GDC compiler.");
    enum compilerOptions = "-s -O3 -Wall";
    string buildCompileString(string files, string packageName)
    {
        return format("gdc %s -I../import -o %s%s%s%s%s", compilerOptions, outdir, prefix, packageName, extension, files);
    }
}
else version(LDC)
{
    pragma(msg, "Using the LDC compiler.");
    enum compilerOptions = "-lib -O -release -enable-inlining -property -w -wi";
    string buildCompileString(string files, string packageName)
    {
        return format("ldc2 %s -I../import -of%s%s%s%s%s", compilerOptions, outdir, prefix, packageName, extension, files);
    }
}
else
{
    static assert(false, "Unknown compiler.");
}


// Package names
enum packUtil = "DerelictUtil";
enum packGL3 = "DerelictGL3";
enum packGLFW3 = "DerelictGLFW3";
enum packIL = "DerelictIL";

// Source paths
enum srcDerelict = "../import/derelict/";
enum srcUtil = srcDerelict ~ "util/";
enum srcGL3 = srcDerelict ~ "opengl3/";
enum srcGLFW3 = srcDerelict ~ "glfw3/";
enum srcIL = srcDerelict ~ "devil/";

// Map package names to source paths.
string[string] pathMap;

static this()
{
    // Initializes the source path map.
    pathMap =
    [
        packUtil : srcUtil,
        packGL3 : srcGL3,
        packGLFW3 : srcGLFW3,
        packIL : srcIL,
    ];
}

int main(string[] args)
{
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
    writeln("Building only the packages specified.");
    try
    {
        // If any of the args matches a key in the pathMap, build
        // that package.
        foreach(s; args)
        {
            if(s in pathMap)
                buildPackage(s);
        }
    }
    catch(ErrnoException e) {}
}

void buildPackage(string packageName)
{
    writefln("Building %s", packageName);
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

    string arg = buildCompileString(joined, packageName);

    string s = shell(arg);
    writeln(s);
    writeln("Build succeeded.");
}