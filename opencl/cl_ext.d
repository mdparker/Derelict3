module derelict.opencl.cl_ext;

import derelict.opencl.types;

extern (System)
{
    // OpenCL 1.0
    alias nothrow cl_int function(cl_mem, void function(cl_mem, void*), void*) da_clSetMemObjectDestructorAPPLE;
    alias nothrow void function(const(char*), const(void*), size_t, void*) da_clLogMessagesToSystemLogAPPLE;
    alias nothrow void function(const(char*), const(void*), size_t, void*) da_clLogMessagesToStdoutAPPLE;
    alias nothrow void function(const(char*), const(void*), size_t, void*) da_clLogMessagesToStderrAPPLE;
    alias nothrow cl_int function(cl_uint, cl_platform_id*, cl_uint*) da_clIcdGetPlatformIDsKHR;
    // OpenCL 1.1
    alias nothrow cl_int function(cl_device_id) da_clReleaseDeviceEXT;
    alias nothrow cl_int function(cl_device_id) da_clRetainDeviceEXT;
    alias nothrow cl_int function(cl_device_id, const(cl_device_partition_property_ext*), cl_uint, cl_device_id*, cl_uint*) da_clCreateSubDevicesEXT;
    // OpenCL 1.2
    alias nothrow cl_int function(cl_context) da_clTerminateContextKHR;
}

__gshared
{
    // OpenCL 1.0
    da_clSetMemObjectDestructorAPPLE clSetMemObjectDestructorAPPLE;
    da_clLogMessagesToSystemLogAPPLE clLogMessagesToSystemLogAPPLE;
    da_clLogMessagesToStdoutAPPLE clLogMessagesToStdoutAPPLE;
    da_clLogMessagesToStderrAPPLE clLogMessagesToStderrAPPLE;
    da_clIcdGetPlatformIDsKHR clIcdGetPlatformIDsKHR;
    // OpenCL 1.1
    da_clReleaseDeviceEXT clReleaseDeviceEXT;
    da_clRetainDeviceEXT clRetainDeviceEXT;
    da_clCreateSubDevicesEXT clCreateSubDevicesEXT;
    // OpenCL 1.2
    da_clTerminateContextKHR clTerminateContextKHR;
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

    private __gshared bool _EXT_cl_APPLE_SetMemObjectDestructor;
    public bool EXT_cl_APPLE_SetMemObjectDestructor() @property { return _EXT_cl_APPLE_SetMemObjectDestructor; }
    private void load_cl_APPLE_SetMemObjectDestructor(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clSetMemObjectDestructorAPPLE, "clSetMemObjectDestructorAPPLE", true);
            _EXT_cl_APPLE_SetMemObjectDestructor = true;
        }
        catch(Exception e)
        {
            _EXT_cl_APPLE_SetMemObjectDestructor = false;
        }
    }

    private __gshared bool _EXT_cl_APPLE_ContextLoggingFunctions;
    public bool EXT_cl_APPLE_ContextLoggingFunctions() @property { return _EXT_cl_APPLE_ContextLoggingFunctions; }
    private void load_cl_APPLE_ContextLoggingFunctions(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clLogMessagesToSystemLogAPPLE, "clLogMessagesToSystemLogAPPLE", true);
            bindFunc(cast(void**)&clLogMessagesToStdoutAPPLE, "clLogMessagesToStdoutAPPLE", true);
            bindFunc(cast(void**)&clLogMessagesToStderrAPPLE, "clLogMessagesToStderrAPPLE", true);
            _EXT_cl_APPLE_ContextLoggingFunctions = true;
        }
        catch(Exception e)
        {
            _EXT_cl_APPLE_ContextLoggingFunctions = false;
        }
    }

    private __gshared bool _EXT_cl_khr_icd;
    public bool EXT_cl_khr_icd() @property { return _EXT_cl_khr_icd; }
    private void load_cl_khr_icd(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clIcdGetPlatformIDsKHR, "clIcdGetPlatformIDsKHR", true);
            _EXT_cl_khr_icd = true;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_icd = false;
        }
    }

    private __gshared bool _EXT_cl_ext_device_fission;
    public bool EXT_cl_ext_device_fission() @property { return _EXT_cl_ext_device_fission; }
    private void load_cl_ext_device_fission(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clReleaseDeviceEXT, "clReleaseDeviceEXT", true);
            bindFunc(cast(void**)&clRetainDeviceEXT, "clRetainDeviceEXT", true);
            bindFunc(cast(void**)&clCreateSubDevicesEXT, "clCreateSubDevicesEXT", true);
            _EXT_cl_ext_device_fission = true;
        }
        catch(Exception e)
        {
            _EXT_cl_ext_device_fission = false;
        }
    }

    private __gshared bool _EXT_cl_khr_terminate_context;
    public bool EXT_cl_khr_terminate_context() @property { return _EXT_cl_khr_terminate_context; }
    private void load_cl_khr_terminate_context(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clTerminateContextKHR, "clTerminateContextKHR", true);
            _EXT_cl_khr_terminate_context = true;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_terminate_context = false;
        }
    }


    void loadEXT(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        if(clVer >= CLVersion.CL10)
        {
            // OpenCL 1.0
            load_cl_APPLE_SetMemObjectDestructor(bindFunc);
            load_cl_APPLE_ContextLoggingFunctions(bindFunc);
            load_cl_khr_icd(bindFunc);
        }

        if(clVer >= CLVersion.CL11)
        {
            // OpenCL 1.1
            load_cl_ext_device_fission(bindFunc);
        }

        if(clVer >= CLVersion.CL12)
        {
            // OpenCL 1.2
            load_cl_khr_terminate_context(bindFunc);
        }
    }
}
