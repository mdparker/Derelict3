module derelict.opencl.cl_gl_ext;

import derelict.opencl.types;

extern (System)
{
	// OpenCL 1.1
	alias nothrow cl_event function(cl_context, cl_GLsync, cl_int*) da_clCreateEventFromGLsyncKHR;
}

__gshared
{
	// OpenCL 1.1
	da_clCreateEventFromGLsyncKHR clCreateEventFromGLsyncKHR;
}

package
{
    void loadSymbols(void delegate(void**, string, bool doThrow) bindFunc)
    {

	}

    CLVersion reload(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
       	return clVer;
    }

	private __gshared bool _EXT_cl_khr_gl_event;
	bool EXT_cl_khr_gl_event() @property { return _EXT_cl_khr_gl_event; }
	private void load_cl_khr_gl_event(void delegate(void**, string, bool doThrow) bindFunc)
	{
	    try
	    {
    		bindFunc(cast(void**)&clCreateEventFromGLsyncKHR, "clCreateEventFromGLsyncKHR", true);
	        _EXT_cl_khr_gl_event = true;
	    }
	    catch(Exception e)
	    {
	        _EXT_cl_khr_gl_event = false;
	    }
	}

    void loadEXT(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
    	if(clVer >= CLVersion.CL11)
    	{
    		// OpenCL 1.1
        	load_cl_khr_gl_event(bindFunc);
        }
    }
}
