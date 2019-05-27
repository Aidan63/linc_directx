package d3d11.enumerations;

/**
 * Determines the fill mode to use when rendering triangles.
 */
enum abstract D3dFillMode(Int) to Int
{
    /**
     * Draw lines connecting the vertices. Adjacent vertices are not drawn.
     */
    var Wireframe = 2;

    /**
     * Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
     */
    var Solid = 3;
}

@:keep
@:unreflective
@:include('d3d11.h')
@:native('D3D11_FILL_MODE')
extern class NativeD3D11FillMode
{
    //
}
