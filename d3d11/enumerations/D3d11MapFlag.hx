package d3d11.enumerations;

/**
 * Specifies how the CPU should respond when an application calls the `ID3D11DeviceContext::Map` method on a resource that is being used by the GPU.
 */
enum abstract D3d11MapFlag(Int) to Int
{
    /**
     * Specifies that `ID3D11DeviceContext::Map` should return `DXGI_ERROR_WAS_STILL_DRAWING` when the GPU blocks the CPU from accessing a resource.
     * For more information about this error code, see `DXGI_ERROR`.
     */
    var FlagDoNotWait = 0x100000;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_MAP_FLAG')
extern class NativeD3D11MapFlag
{
    //
}
