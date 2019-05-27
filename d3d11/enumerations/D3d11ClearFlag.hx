package d3d11.enumerations;

/**
 * Specifies the parts of the depth stencil to clear.
 */
enum abstract D3d11ClearFlag(Int) to Int
{
    /**
     * Clear the depth buffer, using fast clear if possible, then place the resource in a compressed state.
     */
    var Depth = 0x1;

    /**
     * Clear the stencil buffer, using fast clear if possible, then place the resource in a compressed state.
     */
    var Stencil = 0x2;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_CLEAR_FLAG')
extern class NativeD3D11ClearFlag
{
    //
}
