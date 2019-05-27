package d3d11.enumerations;

/**
 * RGB or alpha blending operation.
 */
enum abstract D3d11BlendOp(Int) to Int
{
    /**
     * Add source 1 and source 2.
     */
    var Add = 1;

    /**
     * Subtract source 1 from source 2.
     */
    var Subtract = 2;

    /**
     * Subtract source 2 from source 1.
     */
    var ReverseSubtract = 3;

    /**
     * Find the minimum of source 1 and source 2.
     */
    var Min = 4;

    /**
     * Find the maximum of source 1 and source 2.
     */
    var Max = 5;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_BLEND_OP')
extern class NativeD3D11BlendOp
{
    //
}
