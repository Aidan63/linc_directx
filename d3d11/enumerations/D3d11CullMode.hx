package d3d11.enumerations;

/**
 * Indicates triangles facing a particular direction are not drawn.
 */
enum abstract D3d11CullMode(Int) to Int
{
    /**
     * Always draw all triangles.
     */
    var None = 1;

    /**
     * Do not draw triangles that are front-facing.
     */
    var Front = 2;

    /**
     * Do not draw triangles that are back-facing.
     */
    var Back = 3;
}

@:keep
@:unreflective
@:include('d3d11.h')
@:native('D3D11_CULL_MODE')
extern class NativeD3D11CullMode
{
    //
}
