package d3d11.enumerations;

/**
 * Specifies how to access a resource used in a depth-stencil view.
 */
enum abstract D3d11DsvDimension(Int) to Int
{
    /**
     * `D3D11_DSV_DIMENSION_UNKNOWN` is not a valid value for `D3D11_DEPTH_STENCIL_VIEW_DESC` and is not used.
     */
    var Unknown;

    /**
     * The resource will be accessed as a 1D texture.
     */
    var Texture1D;

    /**
     * The resource will be accessed as an array of 1D textures.
     */
    var Texture1DArray;

    /**
     * The resource will be accessed as a 2D texture.
     */
    var Texture2D;

    /**
     * The resource will be accessed as an array of 2D textures.
     */
    var Texture2DArray;

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     */
    var Texture2DMS;

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     */
    var Texture2DMSArray;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DSV_DIMENSION')
extern class NativeD3D11DSVDimension
{
    //
}
