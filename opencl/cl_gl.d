module derelict.opencl.cl_gl;

import derelict.opencl.types;

extern (System)
{
    // OpenCL 1.0
    alias nothrow cl_mem function(cl_context, cl_mem_flags, cl_GLuint, int*) da_clCreateFromGLBuffer;
    alias nothrow cl_mem function(cl_context, cl_mem_flags, cl_GLuint, cl_int*) da_clCreateFromGLRenderbuffer;
    alias nothrow cl_int function(cl_mem, cl_gl_object_type*, cl_GLuint*) da_clGetGLObjectInfo;
    alias nothrow cl_int function(cl_mem, cl_gl_texture_info, size_t, void*, size_t*) da_clGetGLTextureInfo;
    alias nothrow cl_int function(cl_command_queue, cl_uint, const(cl_mem*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueAcquireGLObjects;
    alias nothrow cl_int function(cl_command_queue, cl_uint, const(cl_mem*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueReleaseGLObjects;
    alias nothrow cl_int function(const(cl_context_properties*), cl_gl_context_info, size_t, void*, size_t*) da_clGetGLContextInfoKHR;
    // OpenCL 1.1 Deprecated in 1.2
    alias nothrow cl_mem function(cl_context, cl_mem_flags, cl_GLenum, cl_GLint, cl_GLuint, cl_int*) da_clCreateFromGLTexture2D;
    alias nothrow cl_mem function(cl_context, cl_mem_flags, cl_GLenum, cl_GLint, cl_GLuint, cl_int*) da_clCreateFromGLTexture3D;
    // OpenCL 1.2
    alias nothrow cl_mem function(cl_context, cl_mem_flags, cl_GLenum, cl_GLint, cl_GLuint, cl_int*) da_clCreateFromGLTexture;
}

__gshared
{
    // OpenCL 1.0
    da_clCreateFromGLBuffer clCreateFromGLBuffer;
    da_clCreateFromGLRenderbuffer clCreateFromGLRenderbuffer;
    da_clGetGLObjectInfo clGetGLObjectInfo;
    da_clGetGLTextureInfo clGetGLTextureInfo;
    da_clEnqueueAcquireGLObjects clEnqueueAcquireGLObjects;
    da_clEnqueueReleaseGLObjects clEnqueueReleaseGLObjects;
    da_clGetGLContextInfoKHR clGetGLContextInfoKHR;
    // OpenCL 1.1 Deprecated in 1.2
    da_clCreateFromGLTexture2D clCreateFromGLTexture2D;
    da_clCreateFromGLTexture3D clCreateFromGLTexture3D;
    // OpenCL 1.2
    da_clCreateFromGLTexture clCreateFromGLTexture;
}

package
{
    void loadSymbols(void delegate(void**, string, bool doThrow) bindFunc)
    {
        // OpenCL 1.0
        bindFunc(cast(void**)&clCreateFromGLBuffer, "clCreateFromGLBuffer", true);
        bindFunc(cast(void**)&clCreateFromGLRenderbuffer, "clCreateFromGLRenderbuffer", true);
        bindFunc(cast(void**)&clGetGLObjectInfo, "clGetGLObjectInfo", true);
        bindFunc(cast(void**)&clGetGLTextureInfo, "clGetGLTextureInfo", true);
        bindFunc(cast(void**)&clEnqueueAcquireGLObjects, "clEnqueueAcquireGLObjects", true);
        bindFunc(cast(void**)&clEnqueueReleaseGLObjects, "clEnqueueReleaseGLObjects", true);
    }

    CLVersion reload(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        if(clVer <= CLVersion.CL11)
        {
            // OpenCL 1.1 Deprecated in 1.2
            bindFunc(cast(void**)&clCreateFromGLTexture2D, "clCreateFromGLTexture2D", true);
            bindFunc(cast(void**)&clCreateFromGLTexture3D, "clCreateFromGLTexture3D", true);
        }

        if(clVer >= CLVersion.CL12)
        {
            // OpenCL 1.2
            bindFunc(cast(void**)&clCreateFromGLTexture, "clCreateFromGLTexture", true);
        }

        return clVer;
    }

    private __gshared bool _EXT_cl_khr_gl_sharing;
    public bool EXT_cl_khr_gl_sharing() @property { return _EXT_cl_khr_gl_sharing; }
    private void load_cl_khr_gl_sharing(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clGetGLContextInfoKHR, "clGetGLContextInfoKHR", true);
            _EXT_cl_khr_gl_sharing = true;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_gl_sharing = false;
        }
    }

    void loadEXT(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        if(clVer >= CLVersion.CL10)
        {
            // OpenCL 1.0
            load_cl_khr_gl_sharing(bindFunc);
        }
    }
}
