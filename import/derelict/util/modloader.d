module derelict.util.modloader;
import derelict.util.loader;
import derelict.util.sharedlib;
import std.stdio;

/**
 * The mod loader is a very generic thing.
 * However the type of mod lib loader which is created depends on its purpose.
*/
template ModLoader(T : ModLibLoader)
{
	__gshared {
		T[] loaders;
	}
	
	this(T t)
	{
	}
	
	public {
		int loadMod(string file) {
			int id = loaders.length;
			loaders.length++;
			loaders[id] = new T(id, file);
			loaders[id].load();
			return id;
		}
		
		void unloadMod(int id) {
			if (loaders.length > id)
				delete loaders[id];	
		}
		
		T getModLoader(int id) {
			if (loaders.length > id)
				return loaders[id];	
			return null;
		}
	}
}

/**
 * Very similar to SharedLibLoader usage.
 * However you define the function type variable in __gshared as an array.
 * Define the array as a dynamic array and increase length before binding to it.
*/
abstract class ModLibLoader : SharedLibLoader {
	protected {
		int index;
	}
	
    public
    {
        this(int id, string binaries) {
            index = id;
            super(binaries);
        }
        
        int getIndex() {
            return index;
        }
    }
}