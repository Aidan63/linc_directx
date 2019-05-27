package dxgi.enumerations;

/**
 * Flags indicating the method the raster uses to create an image on a surface.
 */
enum abstract DxgiModeScanlineOrder(Int) to Int
{
    /**
     * Scanline order is unspecified.
     */
    var Unspecified = 0;

    /**
     * The image is created from the first scanline to the last without skipping any.
     */
    var Progressive = 1;

    /**
     * The image is created beginning with the upper field.
     */
    var UpperFieldFirst = 2;

    /**
     * The image is created beginning with the lower field.
     */
    var LowerFieldFirst = 3;
}

@:keep
@:unreflective
@:include('dxgi.h')
@:native('DXGI_MODE_SCANLINE_ORDER')
extern class NativeDXGIModeScanlineOrder
{
    //
}
