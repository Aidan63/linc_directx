package d3d11.enumerations;

/**
 * The stencil operations that can be performed during depth-stencil testing.
 */
enum abstract D3d11StencilOp(Int) to Int
{
    /**
     * Keep the existing stencil data.
     */
    var Keep = 1;
    
    /**
     * Set the stencil data to 0.
     */
    var Zero = 2;

    /**
     * Set the stencil data to the reference value set by calling `ID3D11DeviceContext::OMSetDepthStencilState`.
     */
    var Replace = 3;

    /**
     * Increment the stencil value by 1, and clamp the result.
     */
    var IncrSat = 4;

    /**
     * Decrement the stencil value by 1, and clamp the result.
     */
    var DecrSat = 5;

    /**
     * Invert the stencil data.
     */
    var Invert = 6;

    /**
     * Increment the stencil value by 1, and wrap the result if necessary.
     */
    var Incr = 7;

    /**
     * Decrement the stencil value by 1, and wrap the result if necessary.
     */
    var Decr = 8;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_STENCIL_OP')
extern class NativeD3D11StencilOp
{
    //
}
