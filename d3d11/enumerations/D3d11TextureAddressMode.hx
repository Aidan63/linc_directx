package d3d11.enumerations;

/**
 * Identify a technique for resolving texture coordinates that are outside of the boundaries of a texture.
 */
enum abstract D3d11TextureAddressMode(Int) to Int
{
    /**
     * Tile the texture at every (u,v) integer junction. For example, for u values between 0 and 3, the texture is repeated three times.
     */
    var Wrap = 1;

    /**
     * Flip the texture at every (u,v) integer junction. For u values between 0 and 1, for example, the texture is addressed normally;
     * between 1 and 2, the texture is flipped (mirrored); between 2 and 3, the texture is normal again; and so on.
     */
    var Mirror = 2;

    /**
     * Texture coordinates outside the range [0.0, 1.0] are set to the texture color at 0.0 or 1.0, respectively.
     */
    var Clamp = 3;

    /**
     * Texture coordinates outside the range [0.0, 1.0] are set to the border color specified in `D3D11_SAMPLER_DESC` or HLSL code.
     */
    var Border = 4;

    /**
     * Similar to `D3D11_TEXTURE_ADDRESS_MIRROR` and `D3D11_TEXTURE_ADDRESS_CLAMP`.
     * Takes the absolute value of the texture coordinate (thus, mirroring around 0), and then clamps to the maximum value.
     */
    var MirrorOnce = 5;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEXTURE_ADDRESS_MODE')
extern class NativeD3D11TextureAddressMode
{
    //
}
