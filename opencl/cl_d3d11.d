module derelict.opencl.cl_d3d11;

import derelict.opencl.types;

extern (System)
{
    // OpenCL 1.2
    alias nothrow cl_int function(cl_platform_id platform, cl_d3d11_device_source_khr d3d_device_source, void* d3d_object, cl_d3d11_device_set_khr d3d_device_set, cl_uint num_entries, cl_device_id* devices, cl_uint* num_devices) da_clGetDeviceIDsFromD3D11KHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, ID3D11Buffer* resource, cl_int* errcode_ret) da_clCreateFromD3D11BufferKHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, ID3D11Texture2D* resource, uint subresource, cl_int* errcode_ret) da_clCreateFromD3D11Texture2DKHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, ID3D11Texture3D* resource, uint subresource, cl_int* errcode_ret) da_clCreateFromD3D11Texture3DKHR;
    alias nothrow cl_int function(cl_command_queue command_queue, cl_uint num_objects, const(cl_mem*) mem_objects, cl_uint num_events_in_wait_list, const(cl_event*) event_wait_list, cl_event* event) da_clEnqueueAcquireD3D11ObjectsKHR;
    alias nothrow cl_int function(cl_command_queue command_queue, cl_uint num_objects, const(cl_mem*) mem_objects, cl_uint num_events_in_wait_list, const(cl_event*) event_wait_list, cl_event* event) da_clEnqueueReleaseD3D11ObjectsKHR;
}

__gshared
{
    // OpenCL 1.2
    da_clGetDeviceIDsFromD3D11KHR clGetDeviceIDsFromD3D11KHR;
    da_clCreateFromD3D11BufferKHR clCreateFromD3D11BufferKHR;
    da_clCreateFromD3D11Texture2DKHR clCreateFromD3D11Texture2DKHR;
    da_clCreateFromD3D11Texture3DKHR clCreateFromD3D11Texture3DKHR;
    da_clEnqueueAcquireD3D11ObjectsKHR clEnqueueAcquireD3D11ObjectsKHR;
    da_clEnqueueReleaseD3D11ObjectsKHR clEnqueueReleaseD3D11ObjectsKHR;
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

    private __gshared bool _EXT_cl_khr_d3d11_sharing;
    public bool EXT_cl_khr_d3d11_sharing() @property { return _EXT_cl_khr_d3d11_sharing; }
    private void load_cl_khr_d3d11_sharing(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clGetDeviceIDsFromD3D11KHR, "clGetDeviceIDsFromD3D11KHR", true);
            bindFunc(cast(void**)&clCreateFromD3D11BufferKHR, "clCreateFromD3D11BufferKHR", true);
            bindFunc(cast(void**)&clCreateFromD3D11Texture2DKHR, "clCreateFromD3D11Texture2DKHR", true);
            bindFunc(cast(void**)&clCreateFromD3D11Texture3DKHR, "clCreateFromD3D11Texture3DKHR", true);
            bindFunc(cast(void**)&clEnqueueAcquireD3D11ObjectsKHR, "clEnqueueAcquireD3D11ObjectsKHR", true);
            bindFunc(cast(void**)&clEnqueueReleaseD3D11ObjectsKHR, "clEnqueueReleaseD3D11ObjectsKHR", true);
            _EXT_cl_khr_d3d11_sharing = true;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_d3d11_sharing = false;
        }
    }

    void loadEXT(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        if(clVer >= CLVersion.CL12)
        {
            // OpenCL 1.2
            load_cl_khr_d3d11_sharing(bindFunc);
        }
    }
}
