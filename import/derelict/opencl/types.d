module derelict.opencl.types;

// cl_platform.h
alias byte      cl_char;
alias ubyte     cl_uchar;
alias short     cl_short;
alias ushort    cl_ushort;
alias int       cl_int;
alias uint      cl_uint;
alias long      cl_long;
alias ulong     cl_ulong;

alias ushort    cl_half;
alias float     cl_float;
alias double    cl_double;

alias uint      cl_GLuint;
alias int       cl_GLint;
alias uint      cl_GLenum;

// cl.h
alias void*     cl_platform_id;
alias void*     cl_device_id;
alias void*     cl_context;
alias void*     cl_command_queue;
alias void*     cl_mem;
alias void*     cl_program;
alias void*     cl_kernel;
alias void*     cl_event;
alias void*     cl_sampler;

alias cl_uint           cl_bool;                     /* WARNING!  Unlike cl_ types in cl_platform.h, cl_bool is not guaranteed to be the same size as the bool in kernels. */ 
alias cl_ulong          cl_bitfield;
alias cl_bitfield       cl_device_type;
alias cl_uint           cl_platform_info;
alias cl_uint           cl_device_info;
alias cl_bitfield       cl_device_fp_config;
alias cl_uint           cl_device_mem_cache_type;
alias cl_uint           cl_device_local_mem_type;
alias cl_bitfield       cl_device_exec_capabilities;
alias cl_bitfield       cl_command_queue_properties;
alias ptrdiff_t         cl_device_partition_property;
alias cl_bitfield       cl_device_affinity_domain;

alias ptrdiff_t         cl_context_properties;
alias cl_uint           cl_context_info;
alias cl_uint           cl_command_queue_info;
alias cl_uint           cl_channel_order;
alias cl_uint           cl_channel_type;
alias cl_bitfield       cl_mem_flags;
alias cl_uint           cl_mem_object_type;
alias cl_uint           cl_mem_info;
alias cl_bitfield       cl_mem_migration_flags;
alias cl_uint           cl_image_info;
alias cl_uint           cl_buffer_create_type;
alias cl_uint           cl_addressing_mode;
alias cl_uint           cl_filter_mode;
alias cl_uint           cl_sampler_info;
alias cl_bitfield       cl_map_flags;
alias cl_uint           cl_program_info;
alias cl_uint           cl_program_build_info;
alias cl_uint           cl_program_binary_type;
alias cl_int            cl_build_status;
alias cl_uint           cl_kernel_info;
alias cl_uint           cl_kernel_arg_info;
alias cl_uint           cl_kernel_arg_address_qualifier;
alias cl_uint           cl_kernel_arg_access_qualifier;
alias cl_bitfield       cl_kernel_arg_type_qualifier;
alias cl_uint           cl_kernel_work_group_info;
alias cl_uint           cl_event_info;
alias cl_uint           cl_command_type;
alias cl_uint           cl_profiling_info;

struct cl_image_format
{
    cl_channel_order    image_channel_order;
    cl_channel_type     image_channel_data_type;
}

struct cl_image_desc
{
    cl_mem_object_type  image_type;
    size_t              image_width;
    size_t              image_height;
    size_t              image_depth;
    size_t              image_array_size;
    size_t              image_row_pitch;
    size_t              image_slice_pitch;
    cl_uint             num_mip_levels;
    cl_uint             num_samples;
    cl_mem              buffer;
}

struct cl_buffer_region
{
    size_t              origin;
    size_t              size;
}

// cl_ext.h
alias cl_ulong          cl_device_partition_property_ext;

// cl_gl.h
alias cl_uint           cl_gl_object_type;
alias cl_uint           cl_gl_texture_info;
alias cl_uint           cl_gl_platform_info;
                
struct __GLsync;
alias __GLsync*         cl_GLsync;

alias cl_uint           cl_gl_context_info;

// cl_d3d10.h
alias void              ID3D10Buffer;
alias void              ID3D10Texture2D;
alias void              ID3D10Texture3D;

alias cl_uint           cl_d3d10_device_source_khr;
alias cl_uint           cl_d3d10_device_set_khr;

// cl_d3d11.h
alias void              ID3D11Buffer;
alias void              ID3D11Texture2D;
alias void              ID3D11Texture3D;

alias cl_uint           cl_d3d11_device_source_khr;
alias cl_uint           cl_d3d11_device_set_khr;

// cl_dx9_media_sharing.h
alias cl_uint           cl_dx9_media_adapter_type_khr;
alias cl_uint           cl_dx9_media_adapter_set_khr;

version(Windows)
{
    alias void          IDirect3DSurface9;
    alias void*         HANDLE;

    struct cl_dx9_surface_info_khr
    {
        IDirect3DSurface9*  resource;
        HANDLE              shared_handle;
    }
}

// This is a Derelict type, not from OpenCL
enum CLVersion
{
    None,
    CL10 = 10,
    CL11 = 11,
    CL12 = 12,
    HighestSupported = CL12,
}
