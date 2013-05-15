module derelict.opencl.constants;

import derelict.opencl.types;

// cl.h

// Error Codes
enum
{
    CL_SUCCESS                                  = 0,
    CL_DEVICE_NOT_FOUND                         = -1,
    CL_DEVICE_NOT_AVAILABLE                     = -2,
    CL_COMPILER_NOT_AVAILABLE                   = -3,
    CL_MEM_OBJECT_ALLOCATION_FAILURE            = -4,
    CL_OUT_OF_RESOURCES                         = -5,
    CL_OUT_OF_HOST_MEMORY                       = -6,
    CL_PROFILING_INFO_NOT_AVAILABLE             = -7,
    CL_MEM_COPY_OVERLAP                         = -8,
    CL_IMAGE_FORMAT_MISMATCH                    = -9,
    CL_IMAGE_FORMAT_NOT_SUPPORTED               = -10,
    CL_BUILD_PROGRAM_FAILURE                    = -11,
    CL_MAP_FAILURE                              = -12,
    CL_MISALIGNED_SUB_BUFFER_OFFSET             = -13,
    CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST= -14,
    CL_COMPILE_PROGRAM_FAILURE                  = -15,
    CL_LINKER_NOT_AVAILABLE                     = -16,
    CL_LINK_PROGRAM_FAILURE                     = -17,
    CL_DEVICE_PARTITION_FAILED                  = -18,
    CL_KERNEL_ARG_INFO_NOT_AVAILABLE            = -19,

    CL_INVALID_VALUE                            = -30,
    CL_INVALID_DEVICE_TYPE                      = -31,
    CL_INVALID_PLATFORM                         = -32,
    CL_INVALID_DEVICE                           = -33,
    CL_INVALID_CONTEXT                          = -34,
    CL_INVALID_QUEUE_PROPERTIES                 = -35,
    CL_INVALID_COMMAND_QUEUE                    = -36,
    CL_INVALID_HOST_PTR                         = -37,
    CL_INVALID_MEM_OBJECT                       = -38,
    CL_INVALID_IMAGE_FORMAT_DESCRIPTOR          = -39,
    CL_INVALID_IMAGE_SIZE                       = -40,
    CL_INVALID_SAMPLER                          = -41,
    CL_INVALID_BINARY                           = -42,
    CL_INVALID_BUILD_OPTIONS                    = -43,
    CL_INVALID_PROGRAM                          = -44,
    CL_INVALID_PROGRAM_EXECUTABLE               = -45,
    CL_INVALID_KERNEL_NAME                      = -46,
    CL_INVALID_KERNEL_DEFINITION                = -47,
    CL_INVALID_KERNEL                           = -48,
    CL_INVALID_ARG_INDEX                        = -49,
    CL_INVALID_ARG_VALUE                        = -50,
    CL_INVALID_ARG_SIZE                         = -51,
    CL_INVALID_KERNEL_ARGS                      = -52,
    CL_INVALID_WORK_DIMENSION                   = -53,
    CL_INVALID_WORK_GROUP_SIZE                  = -54,
    CL_INVALID_WORK_ITEM_SIZE                   = -55,
    CL_INVALID_GLOBAL_OFFSET                    = -56,
    CL_INVALID_EVENT_WAIT_LIST                  = -57,
    CL_INVALID_EVENT                            = -58,
    CL_INVALID_OPERATION                        = -59,
    CL_INVALID_GL_OBJECT                        = -60,
    CL_INVALID_BUFFER_SIZE                      = -61,
    CL_INVALID_MIP_LEVEL                        = -62,
    CL_INVALID_GLOBAL_WORK_SIZE                 = -63,
    CL_INVALID_PROPERTY                         = -64,
    CL_INVALID_IMAGE_DESCRIPTOR                 = -65,
    CL_INVALID_COMPILER_OPTIONS                 = -66,
    CL_INVALID_LINKER_OPTIONS                   = -67,
    CL_INVALID_DEVICE_PARTITION_COUNT           = -68,
}

// cl_bool
enum
{
    CL_FALSE                                    = 0,
    CL_TRUE                                     = 1,
    CL_BLOCKING                                 = CL_TRUE,
    CL_NON_BLOCKING                             = CL_FALSE
}

// cl_platform_info
enum
{
    CL_PLATFORM_PROFILE                         = 0x0900,
    CL_PLATFORM_VERSION                         = 0x0901,
    CL_PLATFORM_NAME                            = 0x0902,
    CL_PLATFORM_VENDOR                          = 0x0903,
    CL_PLATFORM_EXTENSIONS                      = 0x0904,
}

// cl_device_type - bitfield
enum : cl_bitfield
{
    CL_DEVICE_TYPE_DEFAULT                      = (1 << 0),
    CL_DEVICE_TYPE_CPU                          = (1 << 1),
    CL_DEVICE_TYPE_GPU                          = (1 << 2),
    CL_DEVICE_TYPE_ACCELERATOR                  = (1 << 3),
    CL_DEVICE_TYPE_CUSTOM                       = (1 << 4),
    CL_DEVICE_TYPE_ALL                          = 0xFFFFFFFF,
}

// cl_device_info
enum
{
    CL_DEVICE_TYPE                              = 0x1000,
    CL_DEVICE_VENDOR_ID                         = 0x1001,
    CL_DEVICE_MAX_COMPUTE_UNITS                 = 0x1002,
    CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS          = 0x1003,
    CL_DEVICE_MAX_WORK_GROUP_SIZE               = 0x1004,
    CL_DEVICE_MAX_WORK_ITEM_SIZES               = 0x1005,
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR       = 0x1006,
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT      = 0x1007,
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT        = 0x1008,
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG       = 0x1009,
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT      = 0x100A,
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE     = 0x100B,
    CL_DEVICE_MAX_CLOCK_FREQUENCY               = 0x100C,
    CL_DEVICE_ADDRESS_BITS                      = 0x100D,
    CL_DEVICE_MAX_READ_IMAGE_ARGS               = 0x100E,
    CL_DEVICE_MAX_WRITE_IMAGE_ARGS              = 0x100F,
    CL_DEVICE_MAX_MEM_ALLOC_SIZE                = 0x1010,
    CL_DEVICE_IMAGE2D_MAX_WIDTH                 = 0x1011,
    CL_DEVICE_IMAGE2D_MAX_HEIGHT                = 0x1012,
    CL_DEVICE_IMAGE3D_MAX_WIDTH                 = 0x1013,
    CL_DEVICE_IMAGE3D_MAX_HEIGHT                = 0x1014,
    CL_DEVICE_IMAGE3D_MAX_DEPTH                 = 0x1015,
    CL_DEVICE_IMAGE_SUPPORT                     = 0x1016,
    CL_DEVICE_MAX_PARAMETER_SIZE                = 0x1017,
    CL_DEVICE_MAX_SAMPLERS                      = 0x1018,
    CL_DEVICE_MEM_BASE_ADDR_ALIGN               = 0x1019,
    CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE          = 0x101A, // Deprecated in OpenCl 1.2
    CL_DEVICE_SINGLE_FP_CONFIG                  = 0x101B,
    CL_DEVICE_GLOBAL_MEM_CACHE_TYPE             = 0x101C,
    CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE         = 0x101D,
    CL_DEVICE_GLOBAL_MEM_CACHE_SIZE             = 0x101E,
    CL_DEVICE_GLOBAL_MEM_SIZE                   = 0x101F,
    CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE          = 0x1020,
    CL_DEVICE_MAX_CONSTANT_ARGS                 = 0x1021,
    CL_DEVICE_LOCAL_MEM_TYPE                    = 0x1022,
    CL_DEVICE_LOCAL_MEM_SIZE                    = 0x1023,
    CL_DEVICE_ERROR_CORRECTION_SUPPORT          = 0x1024,
    CL_DEVICE_PROFILING_TIMER_RESOLUTION        = 0x1025,
    CL_DEVICE_ENDIAN_LITTLE                     = 0x1026,
    CL_DEVICE_AVAILABLE                         = 0x1027,
    CL_DEVICE_COMPILER_AVAILABLE                = 0x1028,
    CL_DEVICE_EXECUTION_CAPABILITIES            = 0x1029,
    CL_DEVICE_QUEUE_PROPERTIES                  = 0x102A,
    CL_DEVICE_NAME                              = 0x102B,
    CL_DEVICE_VENDOR                            = 0x102C,
    CL_DRIVER_VERSION                           = 0x102D,
    CL_DEVICE_PROFILE                           = 0x102E,
    CL_DEVICE_VERSION                           = 0x102F,
    CL_DEVICE_EXTENSIONS                        = 0x1030,
    CL_DEVICE_PLATFORM                          = 0x1031,
    CL_DEVICE_DOUBLE_FP_CONFIG                  = 0x1032,
    // 0x1033 reserved for CL_DEVICE_HALF_FP_CONFIG
    CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF       = 0x1034,
    CL_DEVICE_HOST_UNIFIED_MEMORY               = 0x1035,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR          = 0x1036,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT         = 0x1037,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_INT           = 0x1038,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG          = 0x1039,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT         = 0x103A,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE        = 0x103B,
    CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF          = 0x103C,
    CL_DEVICE_OPENCL_C_VERSION                  = 0x103D,
    CL_DEVICE_LINKER_AVAILABLE                  = 0x103E,
    CL_DEVICE_BUILT_IN_KERNELS                  = 0x103F,
    CL_DEVICE_IMAGE_MAX_BUFFER_SIZE             = 0x1040,
    CL_DEVICE_IMAGE_MAX_ARRAY_SIZE              = 0x1041,
    CL_DEVICE_PARENT_DEVICE                     = 0x1042,
    CL_DEVICE_PARTITION_MAX_SUB_DEVICES         = 0x1043,
    CL_DEVICE_PARTITION_PROPERTIES              = 0x1044,
    CL_DEVICE_PARTITION_AFFINITY_DOMAIN         = 0x1045,
    CL_DEVICE_PARTITION_TYPE                    = 0x1046,
    CL_DEVICE_REFERENCE_COUNT                   = 0x1047,
    CL_DEVICE_PREFERRED_INTEROP_USER_SYNC       = 0x1048,
    CL_DEVICE_PRINTF_BUFFER_SIZE                = 0x1049,
}

// cl_device_fp_config
enum : cl_bitfield
{
    CL_FP_DENORM                                = (1 << 0),
    CL_FP_INF_NAN                               = (1 << 1),
    CL_FP_ROUND_TO_NEAREST                      = (1 << 2),
    CL_FP_ROUND_TO_ZERO                         = (1 << 3),
    CL_FP_ROUND_TO_INF                          = (1 << 4),
    CL_FP_FMA                                   = (1 << 5),
    CL_FP_SOFT_FLOAT                            = (1 << 6),
    CL_FP_CORRECTLY_ROUNDED_DIVIDE_SQRT         = (1 << 7),
}

// cl_device_mem_cache_type
enum
{
    CL_NONE                                     = 0x0,
    CL_READ_ONLY_CACHE                          = 0x1,
    CL_READ_WRITE_CACHE                         = 0x2,
}

// cl_device_local_mem_type
enum
{
    CL_LOCAL                                    = 0x1,
    CL_GLOBAL                                   = 0x2,
}

// cl_device_exec_capabilities
enum : cl_bitfield
{
    CL_EXEC_KERNEL                              = (1 << 0),
    CL_EXEC_NATIVE_KERNEL                       = (1 << 1),
}

// cl_command_queue_properties
enum : cl_bitfield
{
    CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE      = (1 << 0),
    CL_QUEUE_PROFILING_ENABLE                   = (1 << 1),
}

// cl_context_info
enum
{
    CL_CONTEXT_REFERENCE_COUNT                  = 0x1080,
    CL_CONTEXT_DEVICES                          = 0x1081,
    CL_CONTEXT_PROPERTIES                       = 0x1082,
    CL_CONTEXT_NUM_DEVICES                      = 0x1083,
}

// cl_context_properties
enum
{
    CL_CONTEXT_PLATFORM                         = 0x1084,
    CL_CONTEXT_INTEROP_USER_SYNC                = 0x1085,
}

// cl_device_partition_property
enum : ptrdiff_t
{
    CL_DEVICE_PARTITION_EQUALLY                 = 0x1086,
    CL_DEVICE_PARTITION_BY_COUNTS               = 0x1087,
    CL_DEVICE_PARTITION_BY_COUNTS_LIST_END      = 0x0,
    CL_DEVICE_PARTITION_BY_AFFINITY_DOMAIN      = 0x1088,
}

// cl_device_affinity_domain
enum : cl_bitfield
{
    CL_DEVICE_AFFINITY_DOMAIN_NUMA               = (1 << 0),
    CL_DEVICE_AFFINITY_DOMAIN_L4_CACHE           = (1 << 1),
    CL_DEVICE_AFFINITY_DOMAIN_L3_CACHE           = (1 << 2),
    CL_DEVICE_AFFINITY_DOMAIN_L2_CACHE           = (1 << 3),
    CL_DEVICE_AFFINITY_DOMAIN_L1_CACHE           = (1 << 4),
    CL_DEVICE_AFFINITY_DOMAIN_NEXT_PARTITIONABLE = (1 << 5),
}

// cl_command_queue_info
enum
{
    CL_QUEUE_CONTEXT                            = 0x1090,
    CL_QUEUE_DEVICE                             = 0x1091,
    CL_QUEUE_REFERENCE_COUNT                    = 0x1092,
    CL_QUEUE_PROPERTIES                         = 0x1093,
}

// cl_mem_flags - bitfield
enum : cl_bitfield
{
    CL_MEM_READ_WRITE                           = (1 << 0),
    CL_MEM_WRITE_ONLY                           = (1 << 1),
    CL_MEM_READ_ONLY                            = (1 << 2),
    CL_MEM_USE_HOST_PTR                         = (1 << 3),
    CL_MEM_ALLOC_HOST_PTR                       = (1 << 4),
    CL_MEM_COPY_HOST_PTR                        = (1 << 5),
// reserved                                     = (1 << 6),
    CL_MEM_HOST_WRITE_ONLY                      = (1 << 7),
    CL_MEM_HOST_READ_ONLY                       = (1 << 8),
    CL_MEM_HOST_NO_ACCESS                       = (1 << 9),
}

// cl_mem_migration_flags
enum : cl_bitfield
{
    CL_MIGRATE_MEM_OBJECT_HOST                  = (1 << 0),
    CL_MIGRATE_MEM_OBJECT_CONTENT_UNDEFINED     = (1 << 1),
}

// cl_channel_order
enum
{
    CL_R                                        = 0x10B0,
    CL_A                                        = 0x10B1,
    CL_RG                                       = 0x10B2,
    CL_RA                                       = 0x10B3,
    CL_RGB                                      = 0x10B4,
    CL_RGBA                                     = 0x10B5,
    CL_BGRA                                     = 0x10B6,
    CL_ARGB                                     = 0x10B7,
    CL_INTENSITY                                = 0x10B8,
    CL_LUMINANCE                                = 0x10B9,
    CL_Rx                                       = 0x10BA,
    CL_RGx                                      = 0x10BB,
    CL_RGBx                                     = 0x10BC,
    CL_DEPTH                                    = 0x10BD,
    CL_DEPTH_STENCIL                            = 0x10BE,
}

// cl_channel_type
enum
{
    CL_SNORM_INT8                               = 0x10D0,
    CL_SNORM_INT16                              = 0x10D1,
    CL_UNORM_INT8                               = 0x10D2,
    CL_UNORM_INT16                              = 0x10D3,
    CL_UNORM_SHORT_565                          = 0x10D4,
    CL_UNORM_SHORT_555                          = 0x10D5,
    CL_UNORM_INT_101010                         = 0x10D6,
    CL_SIGNED_INT8                              = 0x10D7,
    CL_SIGNED_INT16                             = 0x10D8,
    CL_SIGNED_INT32                             = 0x10D9,
    CL_UNSIGNED_INT8                            = 0x10DA,
    CL_UNSIGNED_INT16                           = 0x10DB,
    CL_UNSIGNED_INT32                           = 0x10DC,
    CL_HALF_FLOAT                               = 0x10DD,
    CL_FLOAT                                    = 0x10DE,
    CL_UNORM_INT24                              = 0x10DF,
}

// cl_mem_object_type
enum
{
    CL_MEM_OBJECT_BUFFER                        = 0x10F0,
    CL_MEM_OBJECT_IMAGE2D                       = 0x10F1,
    CL_MEM_OBJECT_IMAGE3D                       = 0x10F2,
    CL_MEM_OBJECT_IMAGE2D_ARRAY                 = 0x10F3,
    CL_MEM_OBJECT_IMAGE1D                       = 0x10F4,
    CL_MEM_OBJECT_IMAGE1D_ARRAY                 = 0x10F5,
    CL_MEM_OBJECT_IMAGE1D_BUFFER                = 0x10F6,
}

// cl_mem_info
enum
{
    CL_MEM_TYPE                                 = 0x1100,
    CL_MEM_FLAGS                                = 0x1101,
    CL_MEM_SIZE                                 = 0x1102,
    CL_MEM_HOST_PTR                             = 0x1103,
    CL_MEM_MAP_COUNT                            = 0x1104,
    CL_MEM_REFERENCE_COUNT                      = 0x1105,
    CL_MEM_CONTEXT                              = 0x1106,
    CL_MEM_ASSOCIATED_MEMOBJECT                 = 0x1107,
    CL_MEM_OFFSET                               = 0x1108,
}

// cl_image_info
enum
{
    CL_IMAGE_FORMAT                             = 0x1110,
    CL_IMAGE_ELEMENT_SIZE                       = 0x1111,
    CL_IMAGE_ROW_PITCH                          = 0x1112,
    CL_IMAGE_SLICE_PITCH                        = 0x1113,
    CL_IMAGE_WIDTH                              = 0x1114,
    CL_IMAGE_HEIGHT                             = 0x1115,
    CL_IMAGE_DEPTH                              = 0x1116,
    CL_IMAGE_ARRAY_SIZE                         = 0x1117,
    CL_IMAGE_BUFFER                             = 0x1118,
    CL_IMAGE_NUM_MIP_LEVELS                     = 0x1119,
    CL_IMAGE_NUM_SAMPLES                        = 0x111A,
}

// cl_addressing_mode
enum
{
    CL_ADDRESS_NONE                             = 0x1130,
    CL_ADDRESS_CLAMP_TO_EDGE                    = 0x1131,
    CL_ADDRESS_CLAMP                            = 0x1132,
    CL_ADDRESS_REPEAT                           = 0x1133,
    CL_ADDRESS_MIRRORED_REPEAT                  = 0x1134,
}

// cl_filter_mode
enum
{
    CL_FILTER_NEAREST                           = 0x1140,
    CL_FILTER_LINEAR                            = 0x1141,
}

// cl_sampler_info
enum
{
    CL_SAMPLER_REFERENCE_COUNT                  = 0x1150,
    CL_SAMPLER_CONTEXT                          = 0x1151,
    CL_SAMPLER_NORMALIZED_COORDS                = 0x1152,
    CL_SAMPLER_ADDRESSING_MODE                  = 0x1153,
    CL_SAMPLER_FILTER_MODE                      = 0x1154,
}

// cl_map_flags - bitfield
enum : cl_bitfield
{
    CL_MAP_READ                                 = (1 << 0),
    CL_MAP_WRITE                                = (1 << 1),
    CL_MAP_WRITE_INVALIDATE_REGION              = (1 << 2),
}

// cl_program_info
enum
{
    CL_PROGRAM_REFERENCE_COUNT                  = 0x1160,
    CL_PROGRAM_CONTEXT                          = 0x1161,
    CL_PROGRAM_NUM_DEVICES                      = 0x1162,
    CL_PROGRAM_DEVICES                          = 0x1163,
    CL_PROGRAM_SOURCE                           = 0x1164,
    CL_PROGRAM_BINARY_SIZES                     = 0x1165,
    CL_PROGRAM_BINARIES                         = 0x1166,
    CL_PROGRAM_NUM_KERNELS                      = 0x1167,
    CL_PROGRAM_KERNEL_NAMES                     = 0x1168,
}

// cl_program_build_info
enum
{
    CL_PROGRAM_BUILD_STATUS                     = 0x1181,
    CL_PROGRAM_BUILD_OPTIONS                    = 0x1182,
    CL_PROGRAM_BUILD_LOG                        = 0x1183,
    CL_PROGRAM_BINARY_TYPE                      = 0x1184,
}

// cl_program_binary_type
enum
{
    CL_PROGRAM_BINARY_TYPE_NONE                 = 0x0,
    CL_PROGRAM_BINARY_TYPE_COMPILED_OBJECT      = 0x1,
    CL_PROGRAM_BINARY_TYPE_LIBRARY              = 0x2,
    CL_PROGRAM_BINARY_TYPE_EXECUTABLE           = 0x4,
}

// cl_build_status
enum
{
    CL_BUILD_SUCCESS                            =  0,
    CL_BUILD_NONE                               = -1,
    CL_BUILD_ERROR                              = -2,
    CL_BUILD_IN_PROGRESS                        = -3,
}

// cl_kernel_info
enum
{
    CL_KERNEL_FUNCTION_NAME                     = 0x1190,
    CL_KERNEL_NUM_ARGS                          = 0x1191,
    CL_KERNEL_REFERENCE_COUNT                   = 0x1192,
    CL_KERNEL_CONTEXT                           = 0x1193,
    CL_KERNEL_PROGRAM                           = 0x1194,
    CL_KERNEL_ATTRIBUTES                        = 0x1195,
}

// cl_kernel_arg_info
enum
{
    CL_KERNEL_ARG_ADDRESS_QUALIFIER             = 0x1196,
    CL_KERNEL_ARG_ACCESS_QUALIFIER              = 0x1197,
    CL_KERNEL_ARG_TYPE_NAME                     = 0x1198,
    CL_KERNEL_ARG_TYPE_QUALIFIER                = 0x1199,
    CL_KERNEL_ARG_NAME                          = 0x119A,
}

// cl_kernel_arg_address_qualifier
enum
{
    CL_KERNEL_ARG_ADDRESS_GLOBAL                = 0x119B,
    CL_KERNEL_ARG_ADDRESS_LOCAL                 = 0x119C,
    CL_KERNEL_ARG_ADDRESS_CONSTANT              = 0x119D,
    CL_KERNEL_ARG_ADDRESS_PRIVATE               = 0x119E,
}

// cl_kernel_arg_access_qualifier
enum
{
    CL_KERNEL_ARG_ACCESS_READ_ONLY              = 0x11A0,
    CL_KERNEL_ARG_ACCESS_WRITE_ONLY             = 0x11A1,
    CL_KERNEL_ARG_ACCESS_READ_WRITE             = 0x11A2,
    CL_KERNEL_ARG_ACCESS_NONE                   = 0x11A3,
}

// cl_kernel_arg_type_qualifer
enum : cl_bitfield
{
    CL_KERNEL_ARG_TYPE_NONE                     = 0,
    CL_KERNEL_ARG_TYPE_CONST                    = (1 << 0),
    CL_KERNEL_ARG_TYPE_RESTRICT                 = (1 << 1),
    CL_KERNEL_ARG_TYPE_VOLATILE                 = (1 << 2),
}

// cl_kernel_work_group_info
enum
{
    CL_KERNEL_WORK_GROUP_SIZE                   = 0x11B0,
    CL_KERNEL_COMPILE_WORK_GROUP_SIZE           = 0x11B1,
    CL_KERNEL_LOCAL_MEM_SIZE                    = 0x11B2,
    CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE= 0x11B3,
    CL_KERNEL_PRIVATE_MEM_SIZE                  = 0x11B4,
    CL_KERNEL_GLOBAL_WORK_SIZE                  = 0x11B5,
}

// cl_event_info
enum
{
    CL_EVENT_COMMAND_QUEUE                      = 0x11D0,
    CL_EVENT_COMMAND_TYPE                       = 0x11D1,
    CL_EVENT_REFERENCE_COUNT                    = 0x11D2,
    CL_EVENT_COMMAND_EXECUTION_STATUS           = 0x11D3,
    CL_EVENT_CONTEXT                            = 0x11D4,
}

// cl_command_type
enum
{
    CL_COMMAND_NDRANGE_KERNEL                   = 0x11F0,
    CL_COMMAND_TASK                             = 0x11F1,
    CL_COMMAND_NATIVE_KERNEL                    = 0x11F2,
    CL_COMMAND_READ_BUFFER                      = 0x11F3,
    CL_COMMAND_WRITE_BUFFER                     = 0x11F4,
    CL_COMMAND_COPY_BUFFER                      = 0x11F5,
    CL_COMMAND_READ_IMAGE                       = 0x11F6,
    CL_COMMAND_WRITE_IMAGE                      = 0x11F7,
    CL_COMMAND_COPY_IMAGE                       = 0x11F8,
    CL_COMMAND_COPY_IMAGE_TO_BUFFER             = 0x11F9,
    CL_COMMAND_COPY_BUFFER_TO_IMAGE             = 0x11FA,
    CL_COMMAND_MAP_BUFFER                       = 0x11FB,
    CL_COMMAND_MAP_IMAGE                        = 0x11FC,
    CL_COMMAND_UNMAP_MEM_OBJECT                 = 0x11FD,
    CL_COMMAND_MARKER                           = 0x11FE,
    CL_COMMAND_ACQUIRE_GL_OBJECTS               = 0x11FF,
    CL_COMMAND_RELEASE_GL_OBJECTS               = 0x1200,
    CL_COMMAND_READ_BUFFER_RECT                 = 0x1201,
    CL_COMMAND_WRITE_BUFFER_RECT                = 0x1202,
    CL_COMMAND_COPY_BUFFER_RECT                 = 0x1203,
    CL_COMMAND_USER                             = 0x1204,
    CL_COMMAND_BARRIER                          = 0x1205,
    CL_COMMAND_MIGRATE_MEM_OBJECTS              = 0x1206,
    CL_COMMAND_FILL_BUFFER                      = 0x1207,
    CL_COMMAND_FILL_IMAGE                       = 0x1208,
}

// cl_command_execution_status
enum
{
    CL_COMPLETE                                 = 0x0,
    CL_RUNNING                                  = 0x1,
    CL_SUBMITTED                                = 0x2,
    CL_QUEUED                                   = 0x3,
}

// cl_buffer_create_type
enum
{
    CL_BUFFER_CREATE_TYPE_REGION                = 0x1220,
}

// cl_profiling_info
enum
{
    CL_PROFILING_COMMAND_QUEUED                 = 0x1280,
    CL_PROFILING_COMMAND_SUBMIT                 = 0x1281,
    CL_PROFILING_COMMAND_START                  = 0x1282,
    CL_PROFILING_COMMAND_END                    = 0x1283,
}


// cl_ext.h

// cl_khr_fp16 extension
enum CL_DEVICE_HALF_FP_CONFIG                   = 0x1033;

// cl_APPLE_SetMemObjectDestructor extension
enum cl_APPLE_SetMemObjectDestructor            = 1;

// cl_APPLE_ContextLoggingFunctions
enum cl_APPLE_ContextLoggingFunctions           = 1;

// cl_khr_icd extension
enum cl_khr_icd                                 = 1;
// cl_platform_info
enum CL_PLATFORM_ICD_SUFFIX_KHR                 = 0x0920;
// Additional Error Codes
enum CL_PLATFORM_NOT_FOUND_KHR                  = -1001;

// cl_khr_initalize_memory extension
enum CL_CONTEXT_MEMORY_INITIALIZE_KHR           = 0x200E;

// cl_khr_terminate_context extension
enum cl_khr_terminate_context                   = 1;
enum
{
    CL_DEVICE_TERMINATE_CAPABILITY_KHR          = 0x200F,
    CL_CONTEXT_TERMINATE_KHR                    = 0x2010,
}

// cl_nv_device_attribute_query extension
enum
{
    CL_DEVICE_COMPUTE_CAPABILITY_MAJOR_NV       = 0x4000,
    CL_DEVICE_COMPUTE_CAPABILITY_MINOR_NV       = 0x4001,
    CL_DEVICE_REGISTERS_PER_BLOCK_NV            = 0x4002,
    CL_DEVICE_WARP_SIZE_NV                      = 0x4003,
    CL_DEVICE_GPU_OVERLAP_NV                    = 0x4004,
    CL_DEVICE_KERNEL_EXEC_TIMEOUT_NV            = 0x4005,
    CL_DEVICE_INTEGRATED_MEMORY_NV              = 0x4006,
}

// cl_amd_device_attribute_query extension
enum CL_DEVICE_PROFILING_TIMER_OFFSET_AMD       = 0x4036;

// cl_ext_device_fission extension
enum cl_ext_device_fission                      = 1;

// cl_device_partition_property_ext extension
enum
{
    CL_DEVICE_PARTITION_EQUALLY_EXT             = 0x4050,
    CL_DEVICE_PARTITION_BY_COUNTS_EXT           = 0x4051,
    CL_DEVICE_PARTITION_BY_NAMES_EXT            = 0x4052,
    CL_DEVICE_PARTITION_BY_AFFINITY_DOMAIN_EXT  = 0x4053,
}

// clDeviceGetInfo selectors
enum
{
    CL_DEVICE_PARENT_DEVICE_EXT                 = 0x4054,
    CL_DEVICE_PARTITION_TYPES_EXT               = 0x4055,
    CL_DEVICE_AFFINITY_DOMAINS_EXT              = 0x4056,
    CL_DEVICE_REFERENCE_COUNT_EXT               = 0x4057,
    CL_DEVICE_PARTITION_STYLE_EXT               = 0x4058,
}

// error codes
enum
{
    CL_DEVICE_PARTITION_FAILED_EXT              = -1057,
    CL_INVALID_PARTITION_COUNT_EXT              = -1058,
    CL_INVALID_PARTITION_NAME_EXT               = -1059,
}

// CL_AFFINITY_DOMAINs
enum
{
    CL_AFFINITY_DOMAIN_L1_CACHE_EXT             = 0x1,
    CL_AFFINITY_DOMAIN_L2_CACHE_EXT             = 0x2,
    CL_AFFINITY_DOMAIN_L3_CACHE_EXT             = 0x3,
    CL_AFFINITY_DOMAIN_L4_CACHE_EXT             = 0x4,
    CL_AFFINITY_DOMAIN_NUMA_EXT                 = 0x10,
    CL_AFFINITY_DOMAIN_NEXT_FISSIONABLE_EXT     = 0x100,
}

// cl_device_partition_property_ext list terminators
enum
{
    CL_PROPERTIES_LIST_END_EXT                  = (cast(cl_device_partition_property_ext) 0),
    CL_PARTITION_BY_COUNTS_LIST_END_EXT         = (cast(cl_device_partition_property_ext) 0),
    CL_PARTITION_BY_NAMES_LIST_END_EXT          = (cast(cl_device_partition_property_ext) 0 - 1),
}


// cl_gl.h

// cl_gl_object_type
enum
{
    CL_GL_OBJECT_BUFFER                         = 0x2000,
    CL_GL_OBJECT_TEXTURE2D                      = 0x2001,
    CL_GL_OBJECT_TEXTURE3D                      = 0x2002,
    CL_GL_OBJECT_RENDERBUFFER                   = 0x2003,
    CL_GL_OBJECT_TEXTURE2D_ARRAY                = 0x200E,
    CL_GL_OBJECT_TEXTURE1D                      = 0x200F,
    CL_GL_OBJECT_TEXTURE1D_ARRAY                = 0x2010,
    CL_GL_OBJECT_TEXTURE_BUFFER                 = 0x2011,
}

// cl_gl_texture_info
enum
{
    CL_GL_TEXTURE_TARGET                        = 0x2004,
    CL_GL_MIPMAP_LEVEL                          = 0x2005,
    CL_GL_NUM_SAMPLES                           = 0x2012,
}

// Additional Error Codes
enum CL_INVALID_GL_SHAREGROUP_REFERENCE_KHR     = -1000;

// cl_gl_context_info
enum
{
    CL_CURRENT_DEVICE_FOR_GL_CONTEXT_KHR        = 0x2006,
    CL_DEVICES_FOR_GL_CONTEXT_KHR               = 0x2007,
}

// Additional cl_context_properties
enum
{
    CL_GL_CONTEXT_KHR                           = 0x2008,
    CL_EGL_DISPLAY_KHR                          = 0x2009,
    CL_GLX_DISPLAY_KHR                          = 0x200A,
    CL_WGL_HDC_KHR                              = 0x200B,
    CL_CGL_SHAREGROUP_KHR                       = 0x200C,
}

// cl_khr_gl_sharing extension
enum cl_khr_gl_sharing                          = 1;


// cl_gl_ext.h

// cl_khr_gl_event extension
enum CL_COMMAND_GL_FENCE_SYNC_OBJECT_KHR        = 0x200D;


// cl_d3d10.h

// cl_khr_d3d10_sharing extension
enum cl_khr_d3d10_sharing                           = 1;

// Error Codes
enum
{
    CL_INVALID_D3D10_DEVICE_KHR                     = -1002,
    CL_INVALID_D3D10_RESOURCE_KHR                   = -1003,
    CL_D3D10_RESOURCE_ALREADY_ACQUIRED_KHR          = -1004,
    CL_D3D10_RESOURCE_NOT_ACQUIRED_KHR              = -1005,
}

// cl_d3d10_device_source_nv
enum
{
    CL_D3D10_DEVICE_KHR                             = 0x4010,
    CL_D3D10_DXGI_ADAPTER_KHR                       = 0x4011,
}

// cl_d3d10_device_set_nv
enum
{
    CL_PREFERRED_DEVICES_FOR_D3D10_KHR              = 0x4012,
    CL_ALL_DEVICES_FOR_D3D10_KHR                    = 0x4013,
}

// cl_context_info
enum
{
    CL_CONTEXT_D3D10_DEVICE_KHR                     = 0x4014,
    CL_CONTEXT_D3D10_PREFER_SHARED_RESOURCES_KHR    = 0x402C,
}

// cl_mem_info
enum CL_MEM_D3D10_RESOURCE_KHR                      = 0x4015;

// cl_image_info
enum CL_IMAGE_D3D10_SUBRESOURCE_KHR                 = 0x4016;

// cl_command_type
enum CL_COMMAND_ACQUIRE_D3D10_OBJECTS_KHR           = 0x4017;
enum CL_COMMAND_RELEASE_D3D10_OBJECTS_KHR           = 0x4018;


// cl_d3d11.h

// cl_khr_d3d11_sharing extension
enum cl_khr_d3d11_sharing = 1;

// Error Codes
enum
{
    CL_INVALID_D3D11_DEVICE_KHR                     = -1006,
    CL_INVALID_D3D11_RESOURCE_KHR                   = -1007,
    CL_D3D11_RESOURCE_ALREADY_ACQUIRED_KHR          = -1008,
    CL_D3D11_RESOURCE_NOT_ACQUIRED_KHR              = -1009,
}

// cl_d3d11_device_source
enum
{
    CL_D3D11_DEVICE_KHR                             = 0x4019,
    CL_D3D11_DXGI_ADAPTER_KHR                       = 0x401A,
}

// cl_d3d11_device_set
enum
{
    CL_PREFERRED_DEVICES_FOR_D3D11_KHR              = 0x401B,
    CL_ALL_DEVICES_FOR_D3D11_KHR                    = 0x401C,
}

// cl_context_info
enum
{
    CL_CONTEXT_D3D11_DEVICE_KHR                     = 0x401D,
    CL_CONTEXT_D3D11_PREFER_SHARED_RESOURCES_KHR    = 0x402D,
}

// cl_mem_info
enum CL_MEM_D3D11_RESOURCE_KHR                      = 0x401E;

// cl_image_info
enum CL_IMAGE_D3D11_SUBRESOURCE_KHR                 = 0x401F;

// cl_command_type
enum
{
    CL_COMMAND_ACQUIRE_D3D11_OBJECTS_KHR            = 0x4020,
    CL_COMMAND_RELEASE_D3D11_OBJECTS_KHR            = 0x4021,
}


// cl_dx9_media_sharing.h extension

// cl_khr_dx9_media_sharing
enum cl_khr_dx9_media_sharing                       = 1;

// Error Codes
enum
{
    CL_INVALID_DX9_MEDIA_ADAPTER_KHR                = -1010,
    CL_INVALID_DX9_MEDIA_SURFACE_KHR                = -1011,
    CL_DX9_MEDIA_SURFACE_ALREADY_ACQUIRED_KHR       = -1012,
    CL_DX9_MEDIA_SURFACE_NOT_ACQUIRED_KHR           = -1013,
}

// cl_media_adapter_type_khr
enum
{
    CL_ADAPTER_D3D9_KHR                             = 0x2020,
    CL_ADAPTER_D3D9EX_KHR                           = 0x2021,
    CL_ADAPTER_DXVA_KHR                             = 0x2022,
}

// cl_media_adapter_set_khr
enum
{
    CL_PREFERRED_DEVICES_FOR_DX9_MEDIA_ADAPTER_KHR  = 0x2023,
    CL_ALL_DEVICES_FOR_DX9_MEDIA_ADAPTER_KHR        = 0x2024,
}

// cl_context_info
enum
{
    CL_CONTEXT_ADAPTER_D3D9_KHR                     = 0x2025,
    CL_CONTEXT_ADAPTER_D3D9EX_KHR                   = 0x2026,
    CL_CONTEXT_ADAPTER_DXVA_KHR                     = 0x2027,
}

// cl_mem_info
enum
{
    CL_MEM_DX9_MEDIA_ADAPTER_TYPE_KHR               = 0x2028,
    CL_MEM_DX9_MEDIA_SURFACE_INFO_KHR               = 0x2029,
}

// cl_image_info
enum CL_IMAGE_DX9_MEDIA_PLANE_KHR                   = 0x202A;

// cl_command_type
enum
{
    CL_COMMAND_ACQUIRE_DX9_MEDIA_SURFACES_KHR       = 0x202B,
    CL_COMMAND_RELEASE_DX9_MEDIA_SURFACES_KHR       = 0x202C,
}


// cl_platform.h

/* Macro names and corresponding values defined by OpenCL */
enum CL_CHAR_BIT         = 8;
enum CL_SCHAR_MAX        = 127;
enum CL_SCHAR_MIN        = (-127-1);
enum CL_CHAR_MAX         = CL_SCHAR_MAX;
enum CL_CHAR_MIN         = CL_SCHAR_MIN;
enum CL_UCHAR_MAX        = 255;
enum CL_SHRT_MAX         = 32767;
enum CL_SHRT_MIN         = (-32767-1);
enum CL_USHRT_MAX        = 65535;
enum CL_INT_MAX          = 2147483647;
enum CL_INT_MIN          = (-2147483647-1);
enum CL_UINT_MAX         = 0xffffffffU;
enum CL_LONG_MAX         = (cast(cl_long) 0x7FFFFFFFFFFFFFFF);
enum CL_LONG_MIN         = (cast(cl_long) -0x7FFFFFFFFFFFFFFF - 1);
enum CL_ULONG_MAX        = (cast(cl_ulong) 0xFFFFFFFFFFFFFFFF);

enum CL_FLT_DIG          = 6;
enum CL_FLT_MANT_DIG     = 24;
enum CL_FLT_MAX_10_EXP   = +38;
enum CL_FLT_MAX_EXP      = +128;
enum CL_FLT_MIN_10_EXP   = -37;
enum CL_FLT_MIN_EXP      = -125;
enum CL_FLT_RADIX        = 2;

/* Temporary fix for linux 'number unrepresentable' error
version(Windows)
{
    enum CL_FLT_MAX      = 340282346638528859811704183484516925440.0f;
    enum CL_FLT_MIN      = 1.175494350822287507969e-38f;
}
else
{
    enum CL_FLT_MAX      = 0x1.fffffep127f;
    enum CL_FLT_MIN      = 0x1.0p-126f;
}
*/

enum CL_FLT_MAX          = float.max;
enum CL_FLT_MIN          = float.min_normal;
enum CL_FLT_EPSILON      = 0x1.0p-23f;

enum CL_DBL_DIG          = 15;
enum CL_DBL_MANT_DIG     = 53;
enum CL_DBL_MAX_10_EXP   = +308;
enum CL_DBL_MAX_EXP      = +1024;
enum CL_DBL_MIN_10_EXP   = -307;
enum CL_DBL_MIN_EXP      = -1021;
enum CL_DBL_RADIX        = 2;

/* Temporary fix for linux 'number unrepresentable' error
version(Windows)
{
    enum CL_DBL_MAX      = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0;
    enum CL_DBL_MIN      = 2.225073858507201383090e-308;
    enum CL_DBL_EPSILON  = 2.220446049250313080847e-16;
}
else
{
    enum CL_DBL_MAX      = 0x1.fffffffffffffp1023;
    enum CL_DBL_MIN      = 0x1.0p-1022;
    enum CL_DBL_EPSILON  = 0x1.0p-52;
}
*/

enum CL_DBL_MAX      = double.max;
enum CL_DBL_MIN      = double.min_normal;
enum CL_DBL_EPSILON  = double.epsilon;

enum CL_M_E             = 2.718281828459045090796;
enum CL_M_LOG2E         = 1.442695040888963387005;
enum CL_M_LOG10E        = 0.434294481903251816668;
enum CL_M_LN2           = 0.693147180559945286227;
enum CL_M_LN10          = 2.302585092994045901094;
enum CL_M_PI            = 3.141592653589793115998;
enum CL_M_PI_2          = 1.570796326794896557999;
enum CL_M_PI_4          = 0.785398163397448278999;
enum CL_M_1_PI          = 0.318309886183790691216;
enum CL_M_2_PI          = 0.636619772367581382433;
enum CL_M_2_SQRTPI      = 1.128379167095512558561;
enum CL_M_SQRT2         = 1.414213562373095145475;
enum CL_M_SQRT1_2       = 0.707106781186547572737;

enum CL_M_E_F           = 2.71828174591064f;
enum CL_M_LOG2E_F       = 1.44269502162933f;
enum CL_M_LOG10E_F      = 0.43429449200630f;
enum CL_M_LN2_F         = 0.69314718246460f;
enum CL_M_LN10_F        = 2.30258512496948f;
enum CL_M_PI_F          = 3.14159274101257f;
enum CL_M_PI_2_F        = 1.57079637050629f;
enum CL_M_PI_4_F        = 0.78539818525314f;
enum CL_M_1_PI_F        = 0.31830987334251f;
enum CL_M_2_PI_F        = 0.63661974668503f;
enum CL_M_2_SQRTPI_F    = 1.12837922573090f;
enum CL_M_SQRT2_F       = 1.41421353816986f;
enum CL_M_SQRT1_2_F     = 0.70710676908493f;

version(Windows)
{
    enum CL_NAN              = (CL_INFINITY - CL_INFINITY);
    enum CL_HUGE_VALF        = (cast(cl_float) 1e50);
//    enum CL_HUGE_VAL         = (cast(cl_double) 1e500); //Error: number is not representable
}
else version(GNU)
{
    enum CL_NAN              = __builtin_nanf( "" );
    enum CL_HUGE_VALF        = __builtin_huge_valf();
    enum CL_HUGE_VAL         = __builtin_huge_val();
}
else
{
    enum CL_NAN              = float.nan;
    enum CL_HUGE_VALF        = (cast(cl_float) 1e50);
//    enum CL_HUGE_VAL         = (cast(cl_double) 1e500); //Error: number is not representable
}

enum CL_MAXFLOAT         = CL_FLT_MAX;
enum CL_INFINITY         = CL_HUGE_VALF;


// generate code for the CL vector types
// this might look crazy, but eases further changes
// do a pragma(msg, genCLVectorTypes()); for debugging
import std.conv;

// TODO: finish compiler-specific vector types, e.g. __attribute__((vector_size(16))); for GDC
// TODO: CPU instruction sets-specific alignment (MMX, SSE*, AVX)
private string genCLVectorTypes()
{
    string res;
    foreach(type; ["cl_char", "cl_uchar", "cl_short", "cl_ushort", "cl_int", "cl_uint", "cl_long", "cl_ulong", "cl_float", "cl_double"])
    {
        res ~= "alias " ~ type ~ "4 " ~ type ~ "3;"; // cl_xx3 is identical in size, alignment and behavior to cl_xx4. See section 6.1.5. of the spec
        // now add the rest of the types
        foreach (size; [2,4,8,16])
        {
            res ~= `
union ` ~ type ~ to!string(size) ~ `
{
    `;
    // add aligned attribute if inside GDC
    version(GNU) res ~= `pragma(attribute, aligned(` ~ to!string(size) ~ ` * ` ~ type ~ `.sizeof)) `;
    res ~= type ~ "[" ~ to!string(size) ~ `] s;
    alias s this; // allow array access and implicit conversion to the array
    struct { ` ~ type ~ ` x, y` ~ (size<=2 ? "" : ", z, w") ~ (size>=16 ? ", __spacer4, __spacer5, __spacer6, __spacer7, __spacer8, __spacer9, sa, sb, sc, sd, se, sf" : "") ~ `; }
    struct { ` ~ type ~ ` s0, s1` ~ (size<=2 ? "" : ", s2, s3") ~ (size>=8 ? ", s4, s5, s6, s7" : "") ~ (size>=16 ? ", s8, s9, sA, sB, sC, sD, sE, sF" : "") ~ `; }
    struct { ` ~ type ~ (size>2 ? to!string(size/2) : "") ~ ` lo, hi; }`;
    version(GNU) res ~= `
    pragma(attribute, vector_size(` ~ to!string(size) ~ ` * ` ~ type ~ `.sizeof)) ` ~ type ~ " v" ~ to!string(size) ~ `;`;
    res ~= `
}
`;
        }
    }

    return res;
}

//pragma(msg, genCLVectorTypes());
mixin(genCLVectorTypes());
// NOTE: There are no vector types for half


/**
 * Macro to facilitate debugging
 * Usage:
 *   Place mixin(CL_PROGRAM_STRING_DEBUG_INFO) on the line before the first line of your source.
 *   The first line ends with:   CL_PROGRAM_STRING_BEGIN \"
 *   Each line thereafter of OpenCL C source must have a line end
 *   The last line is empty;
 *
 *   Example:
 *
 *   string code = mixin(CL_PROGRAM_STRING_DEBUG_INFO) ~ q{
 *   kernel void foo( int a, float * b )
 *   {
 *      // my comment
 *      *b[ get_global_id(0)] = a;
 *   }
 *   };
 *
 * This should correctly set up the line, (column) and file information for your source
 * string so you can do source level debugging.
 */

// Workaround: OpenCL expects Linux dir separators ("unrecognized character escape sequence")
// Usage: createProgram( CL_PROGRAM_STRING_DEBUG_INFO(__LINE__, __FILE__) ~ q{ __kernel code });
import std.string;

string CL_PROGRAM_STRING_DEBUG_INFO(size_t line, string file)
{
    string ret = "";

    debug
    {
        file = tr(file, "\\", "/");
        ret = "#line " ~ to!string(line) ~ " \"" ~ file ~ "\"" ~ "\n\n";
    }

    return ret;
}
