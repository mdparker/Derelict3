module derelict.opencl.functions;

private
{
    import derelict.opencl.types;
}

extern(System)
{
    // OpenCL 1.0
    alias nothrow cl_int function(cl_uint, cl_platform_id*, cl_uint*) da_clGetPlatformIDs;
    alias nothrow cl_int function(cl_platform_id, cl_platform_info, size_t, void*, size_t*) da_clGetPlatformInfo;
    alias nothrow cl_int function(cl_platform_id, cl_device_type, cl_uint, cl_device_id*, cl_uint*) da_clGetDeviceIDs;
    alias nothrow cl_int function(cl_device_id, cl_device_info, size_t, void*, size_t*) da_clGetDeviceInfo;
    alias nothrow cl_context function(const(cl_context_properties*), cl_uint, const(cl_device_id*), void function(const(char*),  const(void*),  size_t,  void*), void*, cl_int*) da_clCreateContext;
    alias nothrow cl_context function(const(cl_context_properties*), cl_device_type, void function(const(char*),  const(void*),  size_t,  void*), void*, cl_int*) da_clCreateContextFromType;
    alias nothrow cl_int function(cl_context) da_clRetainContext;
    alias nothrow cl_int function(cl_context) da_clReleaseContext;
    alias nothrow cl_int function(cl_context, cl_context_info, size_t, void*, size_t*) da_clGetContextInfo;
    alias nothrow cl_command_queue function(cl_context, cl_device_id, cl_command_queue_properties, cl_int*) da_clCreateCommandQueue;
    alias nothrow cl_int function(cl_command_queue) da_clRetainCommandQueue;
    alias nothrow cl_int function(cl_command_queue) da_clReleaseCommandQueue;
    alias nothrow cl_int function(cl_command_queue, cl_command_queue_info, size_t, void*, size_t*) da_clGetCommandQueueInfo;
    alias nothrow cl_mem function(cl_context, cl_mem_flags, size_t, void*, cl_int*) da_clCreateBuffer;
    alias nothrow cl_int function(cl_mem) da_clRetainMemObject;
    alias nothrow cl_int function(cl_mem) da_clReleaseMemObject;
    alias nothrow cl_int function(cl_context, cl_mem_flags, cl_mem_object_type, cl_uint, cl_image_format*, cl_uint*) da_clGetSupportedImageFormats;
    alias nothrow cl_int function(cl_mem, cl_mem_info, size_t, void*, size_t*) da_clGetMemObjectInfo;
    alias nothrow cl_int function(cl_mem, cl_image_info, size_t, void*, size_t*) da_clGetImageInfo;
    alias nothrow cl_sampler function(cl_context, cl_bool, cl_addressing_mode, cl_filter_mode, cl_int*) da_clCreateSampler;
    alias nothrow cl_int function(cl_sampler) da_clRetainSampler;
    alias nothrow cl_int function(cl_sampler) da_clReleaseSampler;
    alias nothrow cl_int function(cl_sampler, cl_sampler_info, size_t, void*, size_t*) da_clGetSamplerInfo;
    alias nothrow cl_program function(cl_context, cl_uint, const(char*)*, const(size_t*), cl_int*) da_clCreateProgramWithSource;
    alias nothrow cl_program function(cl_context, cl_uint, const(cl_device_id*), const(size_t*), const(ubyte*)*, cl_int*, cl_int*) da_clCreateProgramWithBinary;
    alias nothrow cl_program function(cl_context, cl_uint, const(cl_device_id*), const(char*), cl_int*) da_clCreateProgramWithBuiltInKernels;
    alias nothrow cl_int function(cl_program) da_clRetainProgram;
    alias nothrow cl_int function(cl_program) da_clReleaseProgram;
    alias nothrow cl_int function(cl_program, cl_uint, const(cl_device_id*), const(char*), void function(cl_program, void*), void*) da_clBuildProgram;
    alias nothrow cl_int function(cl_program, cl_program_info, size_t, void*, size_t*) da_clGetProgramInfo;
    alias nothrow cl_int function(cl_program, cl_device_id, cl_program_build_info, size_t, void*, size_t*) da_clGetProgramBuildInfo;
    alias nothrow cl_kernel function(cl_program, const(char*), cl_int*) da_clCreateKernel;
    alias nothrow cl_int function(cl_program, cl_uint, cl_kernel*, cl_uint*) da_clCreateKernelsInProgram;
    alias nothrow cl_int function(cl_kernel) da_clRetainKernel;
    alias nothrow cl_int function(cl_kernel) da_clReleaseKernel;
    alias nothrow cl_int function(cl_kernel, cl_uint, size_t, const(void*)) da_clSetKernelArg;
    alias nothrow cl_int function(cl_kernel, cl_kernel_info, size_t, void*, size_t*) da_clGetKernelInfo;
    alias nothrow cl_int function(cl_kernel, cl_uint, cl_kernel_arg_info, size_t, void*, size_t*) da_clGetKernelArgInfo;
    alias nothrow cl_int function(cl_kernel, cl_device_id, cl_kernel_work_group_info, size_t, void*, size_t*) da_clGetKernelWorkGroupInfo;
    alias nothrow cl_int function(cl_uint, const(cl_event*)) da_clWaitForEvents;
    alias nothrow cl_int function(cl_event, cl_event_info, size_t, void*, size_t*) da_clGetEventInfo;
    alias nothrow cl_int function(cl_event) da_clRetainEvent;
    alias nothrow cl_int function(cl_event) da_clReleaseEvent;
    alias nothrow cl_int function(cl_event, cl_profiling_info, size_t, void*, size_t*) da_clGetEventProfilingInfo;
    alias nothrow cl_int function(cl_command_queue) da_clFlush;
    alias nothrow cl_int function(cl_command_queue) da_clFinish;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_bool, size_t, size_t, void*, cl_uint, const(cl_event*), cl_event*) da_clEnqueueReadBuffer;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_bool, size_t, size_t, const(void*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueWriteBuffer;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_mem, size_t, size_t, size_t, cl_uint, const(cl_event*), cl_event*) da_clEnqueueCopyBuffer;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_bool, const(size_t*), const(size_t*), size_t, size_t, void*, cl_uint, const(cl_event*), cl_event*) da_clEnqueueReadImage;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_bool, const(size_t*), const(size_t*), size_t, size_t, const(void*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueWriteImage;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_mem, const(size_t*), const(size_t*), const(size_t*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueCopyImage;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_mem, const(size_t*), const(size_t*), size_t, cl_uint, const(cl_event*), cl_event*) da_clEnqueueCopyImageToBuffer;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_mem, size_t, const(size_t*), const(size_t*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueCopyBufferToImage;
    alias nothrow void* function(cl_command_queue, cl_mem, cl_bool, cl_map_flags, size_t, size_t, cl_uint, const(cl_event*), cl_event*, cl_int*) da_clEnqueueMapBuffer;
    alias nothrow void* function(cl_command_queue, cl_mem, cl_bool, cl_map_flags, const(size_t*), const(size_t*), size_t*, size_t*, cl_uint, const(cl_event*), cl_event*, cl_int*) da_clEnqueueMapImage;
    alias nothrow cl_int function(cl_command_queue, cl_mem, void*, cl_uint, const(cl_event*), cl_event*) da_clEnqueueUnmapMemObject;
    alias nothrow cl_int function(cl_command_queue, cl_kernel, cl_uint, const(size_t*), const(size_t*), const(size_t*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueNDRangeKernel;
    alias nothrow cl_int function(cl_command_queue, cl_kernel, cl_uint, const(cl_event*), cl_event*) da_clEnqueueTask;
    alias nothrow cl_int function(cl_command_queue, void function(void*), void*, size_t, cl_uint, const(cl_mem*), const(void*)*, cl_uint, const(cl_event*), cl_event*) da_clEnqueueNativeKernel;
    // OpenCL 1.0 Deprecated in 1.1
    alias nothrow cl_int function(cl_command_queue, cl_command_queue_properties, cl_bool, cl_command_queue_properties*) da_clSetCommandQueueProperty;
    // OpenCL 1.1
    alias nothrow cl_mem function(cl_mem, cl_mem_flags, cl_buffer_create_type, const(void*), cl_int*) da_clCreateSubBuffer;
    alias nothrow cl_int function(cl_mem, void function(cl_mem, void*), void*) da_clSetMemObjectDestructorCallback;
    alias nothrow cl_event function(cl_context, cl_int*) da_clCreateUserEvent;
    alias nothrow cl_int function(cl_event, cl_int) da_clSetUserEventStatus;
    alias nothrow cl_int function( cl_event, cl_int, void function(cl_event,  cl_int,  void*), void*) da_clSetEventCallback;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_bool, const(size_t*), const(size_t*), const(size_t*), size_t, size_t, size_t, size_t, void*, cl_uint, const(cl_event*), cl_event*) da_clEnqueueReadBufferRect;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_bool, const(size_t*), const(size_t*), const(size_t*), size_t, size_t, size_t, size_t, const(void*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueWriteBufferRect;
    alias nothrow cl_int function(cl_command_queue, cl_mem, cl_mem, const(size_t*), const(size_t*), const(size_t*), size_t, size_t, size_t, size_t, cl_uint, const(cl_event*), cl_event*) da_clEnqueueCopyBufferRect;
    // OpenCL 1.1 Deprecated in 1.2
    alias nothrow cl_mem function(cl_context, cl_mem_flags, const(cl_image_format*), size_t, size_t, size_t, void*, cl_int*) da_clCreateImage2D;
    alias nothrow cl_mem function(cl_context, cl_mem_flags, const(cl_image_format*), size_t, size_t, size_t, size_t, size_t, void*, cl_int*) da_clCreateImage3D;
    alias nothrow cl_int function(cl_command_queue, cl_event*) da_clEnqueueMarker;
    alias nothrow cl_int function(cl_command_queue, cl_uint, const(cl_event*)) da_clEnqueueWaitForEvents;
    alias nothrow cl_int function(cl_command_queue) da_clEnqueueBarrier;
    alias nothrow cl_int function() da_clUnloadCompiler;
    alias nothrow void* function(const(char*)) da_clGetExtensionFunctionAddress;
    // OpenCL 1.2
    alias nothrow cl_int function(cl_device_id, const(cl_device_partition_property*), cl_uint, cl_device_id*, cl_uint*) da_clCreateSubDevices;
    alias nothrow cl_int function(cl_device_id) da_clRetainDevice;
    alias nothrow cl_int function(cl_device_id) da_clReleaseDevice;
    alias nothrow cl_mem function(cl_context, cl_mem_flags, const(cl_image_format*), const(cl_image_desc*), void*, cl_int*) da_clCreateImage;
    alias nothrow cl_int function(cl_program, cl_uint, const(cl_device_id*), const(char*), cl_uint, const(cl_program*), const(char*)*, void function(cl_program, void*), void*) da_clCompileProgram;
    alias nothrow cl_program function(cl_context, cl_uint, const(cl_device_id*), const(char*), cl_uint, const(cl_program*), void function(cl_program, void*), void*, cl_int* ) da_clLinkProgram;
    alias nothrow cl_int function(cl_platform_id) da_clUnloadPlatformCompiler;
    alias nothrow cl_int function(cl_command_queue, cl_mem, const(void*), size_t, size_t, size_t, cl_uint, const(cl_event*), cl_event*) da_clEnqueueFillBuffer;
    alias nothrow cl_int function(cl_command_queue, cl_mem, const(void*), const(size_t*), const(size_t*), cl_uint, const(cl_event*), cl_event*) da_clEnqueueFillImage;
    alias nothrow cl_int function(cl_command_queue, cl_uint, const(cl_mem*), cl_mem_migration_flags, cl_uint, const(cl_event*), cl_event*) da_clEnqueueMigrateMemObjects;
    alias nothrow cl_int function(cl_command_queue, cl_uint, const(cl_event*), cl_event*) da_clEnqueueMarkerWithWaitList;
    alias nothrow cl_int function(cl_command_queue, cl_uint, const(cl_event*), cl_event*) da_clEnqueueBarrierWithWaitList;
    alias nothrow void* function(cl_platform_id, const(char*)) da_clGetExtensionFunctionAddressForPlatform;
}

__gshared
{
    // OpenCL 1.0
    da_clGetPlatformIDs clGetPlatformIDs;
    da_clGetPlatformInfo clGetPlatformInfo;
    da_clGetDeviceIDs clGetDeviceIDs;
    da_clGetDeviceInfo clGetDeviceInfo;
    da_clCreateContext clCreateContext;
    da_clCreateContextFromType clCreateContextFromType;
    da_clRetainContext clRetainContext;
    da_clReleaseContext clReleaseContext;
    da_clGetContextInfo clGetContextInfo;
    da_clCreateCommandQueue clCreateCommandQueue;
    da_clRetainCommandQueue clRetainCommandQueue;
    da_clReleaseCommandQueue clReleaseCommandQueue;
    da_clGetCommandQueueInfo clGetCommandQueueInfo;
    da_clCreateBuffer clCreateBuffer;
    da_clRetainMemObject clRetainMemObject;
    da_clReleaseMemObject clReleaseMemObject;
    da_clGetSupportedImageFormats clGetSupportedImageFormats;
    da_clGetMemObjectInfo clGetMemObjectInfo;
    da_clGetImageInfo clGetImageInfo;
    da_clCreateSampler clCreateSampler;
    da_clRetainSampler clRetainSampler;
    da_clReleaseSampler clReleaseSampler;
    da_clGetSamplerInfo clGetSamplerInfo;
    da_clCreateProgramWithSource clCreateProgramWithSource;
    da_clCreateProgramWithBinary clCreateProgramWithBinary;
    da_clRetainProgram clRetainProgram;
    da_clReleaseProgram clReleaseProgram;
    da_clBuildProgram clBuildProgram;
    da_clGetProgramInfo clGetProgramInfo;
    da_clGetProgramBuildInfo clGetProgramBuildInfo;
    da_clCreateKernel clCreateKernel;
    da_clCreateKernelsInProgram clCreateKernelsInProgram;
    da_clRetainKernel clRetainKernel;
    da_clReleaseKernel clReleaseKernel;
    da_clSetKernelArg clSetKernelArg;
    da_clGetKernelInfo clGetKernelInfo;
    da_clGetKernelWorkGroupInfo clGetKernelWorkGroupInfo;
    da_clWaitForEvents clWaitForEvents;
    da_clGetEventInfo clGetEventInfo;
    da_clRetainEvent clRetainEvent;
    da_clReleaseEvent clReleaseEvent;
    da_clGetEventProfilingInfo clGetEventProfilingInfo;
    da_clFlush clFlush;
    da_clFinish clFinish;
    da_clEnqueueReadBuffer clEnqueueReadBuffer;
    da_clEnqueueWriteBuffer clEnqueueWriteBuffer;
    da_clEnqueueCopyBuffer clEnqueueCopyBuffer;
    da_clEnqueueReadImage clEnqueueReadImage;
    da_clEnqueueWriteImage clEnqueueWriteImage;
    da_clEnqueueCopyImage clEnqueueCopyImage;
    da_clEnqueueCopyImageToBuffer clEnqueueCopyImageToBuffer;
    da_clEnqueueCopyBufferToImage clEnqueueCopyBufferToImage;
    da_clEnqueueMapBuffer clEnqueueMapBuffer;
    da_clEnqueueMapImage clEnqueueMapImage;
    da_clEnqueueUnmapMemObject clEnqueueUnmapMemObject;
    da_clEnqueueNDRangeKernel clEnqueueNDRangeKernel;
    da_clEnqueueTask clEnqueueTask;
    da_clEnqueueNativeKernel clEnqueueNativeKernel;
    // OpenCL 1.0 Deprecated in 1.1
    da_clSetCommandQueueProperty clSetCommandQueueProperty;
    // OpenCL 1.1
    da_clCreateSubBuffer clCreateSubBuffer;
    da_clSetMemObjectDestructorCallback clSetMemObjectDestructorCallback;
    da_clCreateUserEvent clCreateUserEvent;
    da_clSetUserEventStatus clSetUserEventStatus;
    da_clSetEventCallback clSetEventCallback;
    da_clEnqueueReadBufferRect clEnqueueReadBufferRect;
    da_clEnqueueWriteBufferRect clEnqueueWriteBufferRect;
    da_clEnqueueCopyBufferRect clEnqueueCopyBufferRect;
    // OpenCL 1.1 Deprecated in 1.2
    da_clCreateImage2D clCreateImage2D;
    da_clCreateImage3D clCreateImage3D;
    da_clEnqueueMarker clEnqueueMarker;
    da_clEnqueueWaitForEvents clEnqueueWaitForEvents;
    da_clEnqueueBarrier clEnqueueBarrier;
    da_clUnloadCompiler clUnloadCompiler;
    da_clGetExtensionFunctionAddress clGetExtensionFunctionAddress;
    // OpenCL 1.2
    da_clCreateSubDevices clCreateSubDevices;
    da_clRetainDevice clRetainDevice;
    da_clReleaseDevice clReleaseDevice;
    da_clCreateImage clCreateImage;
    da_clCreateProgramWithBuiltInKernels clCreateProgramWithBuiltInKernels;
    da_clCompileProgram clCompileProgram;
    da_clLinkProgram clLinkProgram;
    da_clUnloadPlatformCompiler clUnloadPlatformCompiler;
    da_clGetKernelArgInfo clGetKernelArgInfo;
    da_clEnqueueFillBuffer clEnqueueFillBuffer;
    da_clEnqueueFillImage clEnqueueFillImage;
    da_clEnqueueMigrateMemObjects clEnqueueMigrateMemObjects;
    da_clEnqueueMarkerWithWaitList clEnqueueMarkerWithWaitList;
    da_clEnqueueBarrierWithWaitList clEnqueueBarrierWithWaitList;
    da_clGetExtensionFunctionAddressForPlatform clGetExtensionFunctionAddressForPlatform;
}
