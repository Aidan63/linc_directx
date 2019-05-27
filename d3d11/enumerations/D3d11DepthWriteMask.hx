package d3d11.enumerations;

/**
 * Identify the portion of a depth-stencil buffer for writing depth data.
 */
enum abstract D3d11DepthWriteMask(Int) to Int
{
    /**
     * Turn off writes to the depth-stencil buffer.
     */
    var Zero = 0;

    /**
     * Turn on writes to the depth-stencil buffer.
     */
    var All = 1;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DEPTH_WRITE_MASK')
extern class NativeD3D11DepthWriteMask
{
    //
}
