package d3d11;

import dxgi.Adapter;
import dxgi.SwapChainDescription;
import dxgi.SwapChain;
import cpp.Star;

// D3D11_RTV_DIMENSION enum

@:enum extern abstract D3D11_RTV_DIMENSION(NATIVE_D3D11_RTV_DIMENSION)
{
    @:native('D3D11_RTV_DIMENSION_UNKNOWN')          var UNKNOWN;
    @:native('D3D11_RTV_DIMENSION_BUFFER')           var BUFFER;
    @:native('D3D11_RTV_DIMENSION_TEXTURE1D')        var TEXTURE1D;
    @:native('D3D11_RTV_DIMENSION_TEXTURE1DARRAY')   var TEXTURE1DARRAY;
    @:native('D3D11_RTV_DIMENSION_TEXTURE2D')        var TEXTURE2D;
    @:native('D3D11_RTV_DIMENSION_TEXTURE2DARRAY')   var TEXTURE2DARRAY;
    @:native('D3D11_RTV_DIMENSION_TEXTURE2DMS')      var TEXTURE2DMS;
    @:native('D3D11_RTV_DIMENSION_TEXTURE2DMSARRAY') var TEXTURE2DMSARRAY;
    @:native('D3D11_RTV_DIMENSION_TEXTURE3D')        var TEXTURE3D;
}

@:native('::cpp::Struct<D3D11_RTV_DIMENSION, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_RTV_DIMENSION {}

// D3D11_COMPARISON_FUNC enum

@:enum extern abstract D3D11_COMPARISON_FUNC(NATIVE_D3D11_COMPARISON_FUNC)
{
    @:native('D3D11_COMPARISON_NEVER')         var NEVER;
    @:native('D3D11_COMPARISON_LESS')          var LESS;
    @:native('D3D11_COMPARISON_EQUAL')         var EQUAL;
    @:native('D3D11_COMPARISON_LESS_EQUAL')    var LESS_EQUAL;
    @:native('D3D11_COMPARISON_GREATER')       var GREATER;
    @:native('D3D11_COMPARISON_NOT_EQUAL')     var NOT_EQUAL;
    @:native('D3D11_COMPARISON_GREATER_EQUAL') var GREATER_EQUAL;
    @:native('D3D11_COMPARISON_ALWAYS')        var ALWAYS;
}

@:native('::cpp::Struct<D3D11_COMPARISON_FUNC, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_COMPARISON_FUNC {}

// D3D11_TEXTURE_ADDRESS_MODE enum

@:enum extern abstract D3D11_TEXTURE_ADDRESS_MODE(NATIVE_D3D11_TEXTURE_ADDRESS_MODE)
{
    @:native('D3D11_TEXTURE_ADDRESS_WRAP')        var WRAP;
    @:native('D3D11_TEXTURE_ADDRESS_MIRROR')      var MIRROR;
    @:native('D3D11_TEXTURE_ADDRESS_CLAMP')       var CLAMP;
    @:native('D3D11_TEXTURE_ADDRESS_BORDER')      var BORDER;
    @:native('D3D11_TEXTURE_ADDRESS_MIRROR_ONCE') var MIRROR_ONCE;
}

@:native('::cpp::Struct<D3D11_TEXTURE_ADDRESS_MODE, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_TEXTURE_ADDRESS_MODE {}

// D3D11_FILTER enum

@:enum extern abstract D3D11_FILTER(NATIVE_D3D11_FILTER)
{
    @:native('D3D11_FILTER_MIN_MAG_MIP_POINT') var MIN_MAG_MIP_POINT;
    @:native('D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR') var MIN_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT') var MIN_POINT_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR') var MIN_POINT_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT') var MIN_LINEAR_MAG_MIP_POINT;
    @:native('D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR') var MIN_LINEAR_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT') var MIN_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_MIN_MAG_MIP_LINEAR') var MIN_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_ANISOTROPIC') var ANISOTROPIC;
    @:native('D3D11_FILTER_COMPARISON_MIN_MAG_MIP_POINT') var COMPARISON_MIN_MAG_MIP_POINT;
    @:native('D3D11_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR') var COMPARISON_MIN_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT') var COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR') var COMPARISON_MIN_POINT_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT') var COMPARISON_MIN_LINEAR_MAG_MIP_POINT;
    @:native('D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR') var COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT') var COMPARISON_MIN_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR') var COMPARISON_MIN_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_COMPARISON_ANISOTROPIC') var COMPARISON_ANISOTROPIC;
    @:native('D3D11_FILTER_MINIMUM_MIN_MAG_MIP_POINT') var MINIMUM_MIN_MAG_MIP_POINT;
    @:native('D3D11_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR') var MINIMUM_MIN_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT') var MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR') var MINIMUM_MIN_POINT_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT') var MINIMUM_MIN_LINEAR_MAG_MIP_POINT;
    @:native('D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR') var MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT') var MINIMUM_MIN_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR') var MINIMUM_MIN_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_MINIMUM_ANISOTROPIC') var MINIMUM_ANISOTROPIC;
    @:native('D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_POINT') var MAXIMUM_MIN_MAG_MIP_POINT;
    @:native('D3D11_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR') var MAXIMUM_MIN_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT') var MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR') var MAXIMUM_MIN_POINT_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT') var MAXIMUM_MIN_LINEAR_MAG_MIP_POINT;
    @:native('D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR') var MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR;
    @:native('D3D11_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT') var MAXIMUM_MIN_MAG_LINEAR_MIP_POINT;
    @:native('D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR') var MAXIMUM_MIN_MAG_MIP_LINEAR;
    @:native('D3D11_FILTER_MAXIMUM_ANISOTROPIC') var MAXIMUM_ANISOTROPIC;
}

@:native('::cpp::Struct<D3D11_FILTER, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_FILTER {}

// D3D11_COLOR_WRITE_ENABLE enum

@:enum extern abstract D3D11_COLOR_WRITE_ENABLE(NATIVE_D3D11_COLOR_WRITE_ENABLE)
{
    @:native('D3D11_COLOR_WRITE_ENABLE_RED')   var RED;
    @:native('D3D11_COLOR_WRITE_ENABLE_GREEN') var GREEN;
    @:native('D3D11_COLOR_WRITE_ENABLE_BLUE')  var BLUE;
    @:native('D3D11_COLOR_WRITE_ENABLE_ALPHA') var ALPHA;
    @:native('D3D11_COLOR_WRITE_ENABLE_ALL')   var ALL;
}

@:native('::cpp::Struct<D3D11_COLOR_WRITE_ENABLE, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_COLOR_WRITE_ENABLE {}

// D3D11_BLEND enum

@:enum extern abstract D3D11_BLEND(NATIVE_D3D11_BLEND)
{
    @:native('D3D11_BLEND_ZERO')             var ZERO;
    @:native('D3D11_BLEND_ONE')              var ONE;
    @:native('D3D11_BLEND_SRC_COLOR')        var SRC_COLOR;
    @:native('D3D11_BLEND_INV_SRC_COLOR')    var INV_SRC_COLOR;
    @:native('D3D11_BLEND_SRC_ALPHA')        var SRC_ALPHA;
    @:native('D3D11_BLEND_INV_SRC_ALPHA')    var INV_SRC_ALPHA;
    @:native('D3D11_BLEND_DEST_ALPHA')       var DEST_ALPHA;
    @:native('D3D11_BLEND_INV_DEST_ALPHA')   var INV_DEST_ALPHA;
    @:native('D3D11_BLEND_DEST_COLOR')       var DEST_COLOR;
    @:native('D3D11_BLEND_INV_DEST_COLOR')   var INV_DEST_COLOR;
    @:native('D3D11_BLEND_SRC_ALPHA_SAT')    var SRC_ALPHA_SAT;
    @:native('D3D11_BLEND_BLEND_FACTOR')     var BLEND_FACTOR;
    @:native('D3D11_BLEND_INV_BLEND_FACTOR') var INV_BLEND_FACTOR;
    @:native('D3D11_BLEND_SRC1_COLOR')       var SRC1_COLOR;
    @:native('D3D11_BLEND_INV_SRC1_COLOR')   var INV_SRC1_COLOR;
    @:native('D3D11_BLEND_SRC1_ALPHA')       var SRC1_ALPHA;
    @:native('D3D11_BLEND_INV_SRC1_ALPHA')   var INV_SRC1_ALPHA;
}

@:native('::cpp::Struct<D3D11_BLEND, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_BLEND {}

// D3D11_BLEND_OP enum

@:enum extern abstract D3D11_BLEND_OP(NATIVE_D3D11_BLEND_OP)
{
    @:native('D3D11_BLEND_OP_ADD')          var ADD;
    @:native('D3D11_BLEND_OP_SUBTRACT')     var SUBTRACT;
    @:native('D3D11_BLEND_OP_REV_SUBTRACT') var REV_SUBTRACT;
    @:native('D3D11_BLEND_OP_MIN')          var MIN;
    @:native('D3D11_BLEND_OP_MAX')          var MAX;
}

@:native('::cpp::Struct<D3D11_BLEND_OP, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_BLEND_OP {}

// D3D11_CULL_MODE enum

@:enum extern abstract D3D11_CULL_MODE(NATIVE_D3D11_CULL_MODE)
{
    @:native('D3D11_CULL_NONE')  var NONE;
    @:native('D3D11_CULL_FRONT') var FRONT;
    @:native('D3D11_CULL_BACK')  var BACK;
}

@:native('::cpp::Struct<D3D11_CULL_MODE, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_CULL_MODE {}

// D3D11_FILL_MODE enum

@:enum extern abstract D3D11_FILL_MODE(NATIVE_D3D11_FILL_MODE)
{
    @:native('D3D11_FILL_WIREFRAME1') var WIREFRAME;
    @:native('D3D11_FILL_SOLID')      var SOLID;
}

@:native('::cpp::Struct<D3D11_FILL_MODE, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_FILL_MODE {}

// D3D11_MAP enum

@:enum extern abstract D3D11_MAP(NATIVE_D3D11_MAP)
{
    @:native('D3D11_MAP_READ')               var READ;
    @:native('D3D11_MAP_WRITE')              var WRITE;
    @:native('D3D11_MAP_READ_WRITE')         var READ_WRITE;
    @:native('D3D11_MAP_WRITE_DISCARD')      var WRITE_DISCARD;
    @:native('D3D11_MAP_WRITE_NO_OVERWRITE') var WRITE_NO_OVERWRITE;
}

@:native('::cpp::Struct<D3D11_MAP, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_MAP {}

// D3D11_INPUT_CLASSIFICATION enum

@:enum extern abstract D3D11_INPUT_CLASSIFICATION(NATIVE_D3D11_INPUT_CLASSIFICATION)
{
    @:native('D3D11_INPUT_PER_VERTEX_DATA')   var PER_VERTEX_DATA;
    @:native('D3D11_INPUT_PER_INSTANCE_DATA') var PER_INSTANCE_DATA;
}

@:native('::cpp::Struct<D3D11_INPUT_CLASSIFICATION, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_INPUT_CLASSIFICATION {}

// D3D11_USAGE enum

@:enum extern abstract D3D11_USAGE(NATIVE_D3D11_USAGE)
{
    @:native('D3D11_USAGE_DEFAULT')   var DEFAULT;
    @:native('D3D11_USAGE_IMMUTABLE') var IMMUTABLE;
    @:native('D3D11_USAGE_DYNAMIC')   var DYNAMIC;
    @:native('D3D11_USAGE_STAGING')   var STAGING;
}

@:native('::cpp::Struct<D3D11_USAGE, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_USAGE {}

// D3D11_BIND_FLAG enum

@:enum extern abstract D3D11_BIND_FLAG(NATIVE_D3D11_BIND_FLAG)
{
    @:native('D3D11_BIND_VERTEX_BUFFER')    var VERTEX_BUFFER;
    @:native('D3D11_BIND_INDEX_BUFFER')     var INDEX_BUFFER;
    @:native('D3D11_BIND_CONSTANT_BUFFER')  var CONSTANT_BUFFER;
    @:native('D3D11_BIND_SHADER_RESOURCE')  var SHADER_RESOURCE;
    @:native('D3D11_BIND_STREAM_OUTPUT')    var STREAM_OUTPUT;
    @:native('D3D11_BIND_RENDER_TARGET')    var RENDER_TARGET;
    @:native('D3D11_BIND_DEPTH_STENCIL')    var DEPTH_STENCIL;
    @:native('D3D11_BIND_UNORDERED_ACCESS') var UNORDERED_ACCESS;
    @:native('D3D11_BIND_DECODER')          var BIND_DECODER;
    @:native('D3D11_BIND_VIDEO_ENCODER')    var VIDEO_ENCODER;
}

@:native('::cpp::Struct<D3D11_BIND_FLAG, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_BIND_FLAG {}

// D3D11_CPU_ACCESS_FLAG enum

@:enum extern abstract D3D11_CPU_ACCESS_FLAG(NATIVE_D3D11_CPU_ACCESS_FLAG)
{
    @:native('D3D11_CPU_ACCESS_WRITE') var WRITE;
    @:native('D3D11_CPU_ACCESS_READ')  var READ;
}

@:native('::cpp::Struct<D3D11_CPU_ACCESS_FLAG, ::cpp::EnumHandler>')
private extern class NATIVE_D3D11_CPU_ACCESS_FLAG {}

// Static functions

@:unreflective
@:include("d3d11.h")
extern class D3D11
{
    inline static function createDeviceAndSwapChain(_adapter : Adapter, _description : Star<SwapChainDescription>, _swapchain : Star<SwapChain>, _device : Star<Device>, _context : Star<DeviceContext>) : Int
    {
        return untyped __cpp__('D3D11CreateDeviceAndSwapChain(
            {0},
            D3D_DRIVER_TYPE_UNKNOWN,
            NULL,
            D3D11_CREATE_DEVICE_DEBUG,
            NULL,
            NULL,
            D3D11_SDK_VERSION,
            {1},
            (IDXGISwapChain**){2},
            (ID3D11Device**){3},
            NULL,
            (ID3D11DeviceContext**){4})', _adapter, _description, swapchain, device, context);
    }

    inline static function createDevice(_adapter : Adapter, _device : Star<Device>, _context : Star<DeviceContext>) : Int
    {
        return untyped __cpp__('D3D11CreateDevice(
            {0},
            D3D_DRIVER_TYPE_UNKNOWN,
            NULL,
            0,
            NULL,
            NULL,
            D3D11_SDK_VERSION,
            {1},
            NULL,
            {2})', _adapter, _device, _context);
    }
}
