package d3d.d3d11;

import dxgi.Adapter;
import dxgi.SwapChainDescription;
import dxgi.SwapChain;

// D3D11_INPUT_CLASSIFICATION enum

@:unreflective
@:enum
extern abstract D3D11_INPUT_CLASSIFICATION(NATIVE_D3D11_INPUT_CLASSIFICATION)
{
    @:native('D3D11_INPUT_PER_VERTEX_DATA')   var PER_VERTEX_DATA;
    @:native('D3D11_INPUT_PER_INSTANCE_DATA') var PER_INSTANCE_DATA;
}

@:unreflective
@:native('D3D11_INPUT_CLASSIFICATION')
private extern class NATIVE_D3D11_INPUT_CLASSIFICATION {}

// D3D11_USAGE enum

@:unreflective
@:enum
extern abstract D3D11_USAGE(NATIVE_D3D11_USAGE)
{
    @:native('D3D11_USAGE_DEFAULT')   var DEFAULT;
    @:native('D3D11_USAGE_IMMUTABLE') var IMMUTABLE;
    @:native('D3D11_USAGE_DYNAMIC')   var DYNAMIC;
    @:native('D3D11_USAGE_STAGING')   var STAGING;
}

@:unreflective
@:native('D3D11_USAGE')
private extern class NATIVE_D3D11_USAGE {}

// D3D11_BIND_FLAG enum

@:unreflective
@:enum
extern abstract D3D11_BIND_FLAG(NATIVE_D3D11_BIND_FLAG)
{
    @:native('D3D11_BIND_VERTEX_BUFFER') var VERTEX_BUFFER;
    @:native('D3D11_BIND_INDEX_BUFFER')  var INDEX_BUFFER;
    @:native('D3D11_BIND_CONSTANT_BUFFER') var CONSTANT_BUFFER;
    @:native('D3D11_BIND_SHADER_RESOURCE') var SHADER_RESOURCE;
    @:native('D3D11_BIND_STREAM_OUTPUT') var STREAM_OUTPUT;
    @:native('D3D11_BIND_RENDER_TARGET') var RENDER_TARGET;
    @:native('D3D11_BIND_DEPTH_STENCIL') var DEPTH_STENCIL;
    @:native('D3D11_BIND_UNORDERED_ACCESS') var UNORDERED_ACCESS;
    @:native('D3D11_BIND_DECODER') var BIND_DECODER;
    @:native('D3D11_BIND_VIDEO_ENCODER') var VIDEO_ENCODER;
}

@:unreflective
@:native('D3D11_BIND_FLAG')
private extern class NATIVE_D3D11_BIND_FLAG {}

// D3D11_CPU_ACCESS_FLAG

@:unreflective
@:enum
extern abstract D3D11_CPU_ACCESS_FLAG(NATIVE_D3D11_CPU_ACCESS_FLAG)
{
    @:native('D3D11_CPU_ACCESS_WRITE') var WRITE;
    @:native('D3D11_CPU_ACCESS_READ') var READ;
}

@:unreflective
@:native('D3D11_CPU_ACCESS_FLAG')
private extern class NATIVE_D3D11_CPU_ACCESS_FLAG {}

// Static functions

@:unreflective
@:include("d3d11.h")
extern class D3D11
{
    inline static function createDeviceAndSwapChain(_adapter : Adapter, _description : SwapChainDescription, _swapchain : SwapChain, _device : Device, _context : DeviceContext) : Int
    {
        return untyped __cpp__('D3D11CreateDeviceAndSwapChain(
            (IDXGIAdapter*){0},
            D3D_DRIVER_TYPE_UNKNOWN,
            NULL,
            NULL,
            NULL,
            NULL,
            D3D11_SDK_VERSION,
            (DXGI_SWAP_CHAIN_DESC*)&{1},
            (IDXGISwapChain**)&{2},
            (ID3D11Device**)&{3},
            NULL,
            (ID3D11DeviceContext**)&{4})', _adapter, _description, swapchain, device, context);
    }
}
