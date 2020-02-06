package dxgi.enumerations;

/**
 * Identifies the alpha value, transparency behavior, of a surface.
 */
enum abstract DxgiAlphaMode(Int) to Int
{
    /**
     * Indicates that the transparency behavior is not specified.
     */
    var Unspecified;

    /**
     * Indicates that the transparency behavior is premultiplied. Each color is first scaled by the alpha value.
     * The alpha value itself is the same in both straight and premultiplied alpha.
     * Typically, no color channel value is greater than the alpha channel value.
     * If a color channel value in a premultiplied format is greater than the alpha channel, the standard source-over blending math results in an additive blend.
     */
    var PreMultiplied;

    /**
     * Indicates that the transparency behavior is not premultiplied.
     * The alpha channel indicates the transparency of the color.
     */
    var Straight;

    /**
     * Indicates to ignore the transparency behavior.
     */
    var Ignore;

    /**
     * Forces this enumeration to compile to 32 bits in size.
     * Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits.
     * This value is not used.
     */
    var ForceDWord = 0xffffffff;
}

@:keep
@:unreflective
@:include('dxgi1_2.h')
@:native('DXGI_ALPHA_MODE')
extern class NativeDXGIAlphaMode
{
    //
}
