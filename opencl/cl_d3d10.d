module derelict.opencl.cl_d3d10;

import derelict.opencl.types;

extern (System)
{
    // OpenCL 1.0
    alias nothrow cl_int function(cl_platform_id platform, cl_d3d10_device_source_khr d3d_device_source, void* d3d_object, cl_d3d10_device_set_khr d3d_device_set, cl_uint num_entries, cl_device_id* devices, cl_uint* num_devices) da_clGetDeviceIDsFromD3D10KHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, ID3D10Buffer* resource, cl_int* errcode_ret) da_clCreateFromD3D10BufferKHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, ID3D10Texture2D* resource, uint subresource, cl_int* errcode_ret) da_clCreateFromD3D10Texture2DKHR;
    alias nothrow cl_mem function(cl_context context, cl_mem_flags flags, ID3D10Texture3D* resource, uint subresource, cl_int* errcode_ret) da_clCreateFromD3D10Texture3DKHR;
    alias nothrow cl_int function(cl_command_queue command_queue, cl_uint num_objects, const(cl_mem*) mem_objects, cl_uint num_events_in_wait_list, const(cl_event*) event_wait_list, cl_event* event) da_clEnqueueAcquireD3D10ObjectsKHR;
    alias nothrow cl_int function(cl_command_queue command_queue, cl_uint num_objects, const(cl_mem*) mem_objects, cl_uint num_events_in_wait_list, const(cl_event*) event_wait_list, cl_event* event) da_clEnqueueReleaseD3D10ObjectsKHR;
}

__gshared
{
    // OpenCL 1.0
    da_clGetDeviceIDsFromD3D10KHR clGetDeviceIDsFromD3D10KHR;
    da_clCreateFromD3D10BufferKHR clCreateFromD3D10BufferKHR;
    da_clCreateFromD3D10Texture2DKHR clCreateFromD3D10Texture2DKHR;
    da_clCreateFromD3D10Texture3DKHR clCreateFromD3D10Texture3DKHR;
    da_clEnqueueAcquireD3D10ObjectsKHR clEnqueueAcquireD3D10ObjectsKHR;
    da_clEnqueueReleaseD3D10ObjectsKHR clEnqueueReleaseD3D10ObjectsKHR;
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

    private __gshared bool _EXT_cl_khr_d3d10_sharing;
    public bool EXT_cl_khr_d3d10_sharing() @property { return _EXT_cl_khr_d3d10_sharing; }
    private void load_cl_khr_d3d10_sharing(void delegate(void**, string, bool doThrow) bindFunc)
    {
        try
        {
            bindFunc(cast(void**)&clGetDeviceIDsFromD3D10KHR, "clGetDeviceIDsFromD3D10KHR", true);
            bindFunc(cast(void**)&clCreateFromD3D10BufferKHR, "clCreateFromD3D10BufferKHR", true);
            bindFunc(cast(void**)&clCreateFromD3D10Texture2DKHR, "clCreateFromD3D10Texture2DKHR", true);
            bindFunc(cast(void**)&clCreateFromD3D10Texture3DKHR, "clCreateFromD3D10Texture3DKHR", true);
            bindFunc(cast(void**)&clEnqueueAcquireD3D10ObjectsKHR, "clEnqueueAcquireD3D10ObjectsKHR", true);
            bindFunc(cast(void**)&clEnqueueReleaseD3D10ObjectsKHR, "clEnqueueReleaseD3D10ObjectsKHR", true);
            _EXT_cl_khr_d3d10_sharing = true;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_d3d10_sharing = false;
        }
    }

    void loadEXT(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        if(clVer >= CLVersion.CL10)
        {
            // OpenCL 1.0
            load_cl_khr_d3d10_sharing(bindFunc);
        }
    }
}
