module derelict.opencl.cl_dx9_media_sharing;

import derelict.opencl.types;

extern (System)
{
    // OpenCL 1.2
    alias nothrow cl_int function(cl_platform_id platform, cl_uint num_media_adapters, cl_dx9_media_adapter_type_khr* media_adapter_type, void* media_adapters, cl_dx9_media_adapter_set_khr media_adapter_set, cl_uint num_entries, cl_device_id* devices, cl_uint* num_devices) da_clGetDeviceIDsFromDX9MediaAdapterKHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, cl_dx9_media_adapter_type_khr adapter_type, void* surface_info, cl_uint plane, cl_int* errcode_ret) da_clCreateFromDX9MediaSurfaceKHR;
    alias nothrow cl_int function(cl_command_queue command_queue, cl_uint num_objects, const(cl_mem*) mem_objects, cl_uint num_events_in_wait_list, const cl_event* event_wait_list, cl_event* event) da_clEnqueueAcquireDX9MediaSurfacesKHR;
    alias nothrow cl_int function(cl_command_queue command_queue, cl_uint num_objects, const(cl_mem*) mem_objects, cl_uint num_events_in_wait_list, const cl_event* event_wait_list, cl_event* event) da_clEnqueueReleaseDX9MediaSurfacesKHR;
}

__gshared
{
    // OpenCL 1.2
    da_clGetDeviceIDsFromDX9MediaAdapterKHR clGetDeviceIDsFromDX9MediaAdapterKHR;
    da_clCreateFromDX9MediaSurfaceKHR clCreateFromDX9MediaSurfaceKHR;
    da_clEnqueueAcquireDX9MediaSurfacesKHR clEnqueueAcquireDX9MediaSurfacesKHR;
    da_clEnqueueReleaseDX9MediaSurfacesKHR clEnqueueReleaseDX9MediaSurfacesKHR;
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

    private __gshared bool _EXT_cl_dx9_media_sharing;
    public bool EXT_cl_dx9_media_sharing() @property { return _EXT_cl_dx9_media_sharing; }
    private void load_cl_dx9_media_sharing(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clGetDeviceIDsFromDX9MediaAdapterKHR, "clGetDeviceIDsFromDX9MediaAdapterKHR", true);
            bindFunc(cast(void**)&clCreateFromDX9MediaSurfaceKHR, "clCreateFromDX9MediaSurfaceKHR", true);
            bindFunc(cast(void**)&clEnqueueAcquireDX9MediaSurfacesKHR, "clEnqueueAcquireDX9MediaSurfacesKHR", true);
            bindFunc(cast(void**)&clEnqueueReleaseDX9MediaSurfacesKHR, "clEnqueueReleaseDX9MediaSurfacesKHR", true);
            _EXT_cl_dx9_media_sharing = true;
        }
        catch(Exception e)
        {
            _EXT_cl_dx9_media_sharing = false;
        }
    }

    void loadEXT(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        if(clVer >= CLVersion.CL12)
        {
            // OpenCL 1.2
            load_cl_dx9_media_sharing(bindFunc);
        }
    }
}
