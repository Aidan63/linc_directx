package d3d11.enumerations;

/**
 * Blend factors, which modulate values for the pixel shader and render target.
 */
enum abstract D3d11Blend(Int) to Int
{
    /**
     * The blend factor is (0, 0, 0, 0). No pre-blend operation.
     */
    var Zero = 1;

    /**
     * The blend factor is (1, 1, 1, 1). No pre-blend operation.
     */
    var One = 2;

    /**
     * The blend factor is (Rₛ, Gₛ, Bₛ, Aₛ), that is color data (RGB) from a pixel shader.
     * No pre-blend operation.
     */
    var SourceColor = 3;

    /**
     * The blend factor is (1 - Rₛ, 1 - Gₛ, 1 - Bₛ, 1 - Aₛ), that is color data (RGB) from a pixel shader.
     * The pre-blend operation inverts the data, generating 1 - RGB.
     */
    var InverseSourceColor = 4;

    /**
     * The blend factor is (Aₛ, Aₛ, Aₛ, Aₛ), that is alpha data (A) from a pixel shader.
     * No pre-blend operation.
     */
    var SourceAlpha = 5;

    /**
     * The blend factor is ( 1 - Aₛ, 1 - Aₛ, 1 - Aₛ, 1 - Aₛ), that is alpha data (A) from a pixel shader.
     * The pre-blend operation inverts the data, generating 1 - A.
     */
    var InverseSourceAlpha = 6;

    /**
     * The blend factor is (Ad Ad Ad Ad), that is alpha data from a render target.
     * No pre-blend operation.
     */
    var DestinationAlpha = 7;

    /**
     * The blend factor is (1 - Ad 1 - Ad 1 - Ad 1 - Ad), that is alpha data from a render target.
     * The pre-blend operation inverts the data, generating 1 - A.
     */
    var InverseDestinationAlpha = 8;

    /**
     * The blend factor is (Rd, Gd, Bd, Ad), that is color data from a render target.
     * No pre-blend operation.
     */
    var DestinationColor = 9;

    /**
     * The blend factor is (1 - Rd, 1 - Gd, 1 - Bd, 1 - Ad), that is color data from a render target.
     * The pre-blend operation inverts the data, generating 1 - RGB.
     */
    var InverseDestinationColour = 10;

    /**
     * The blend factor is (f, f, f, 1); where f = min(Aₛ, 1 - Ad).
     * The pre-blend operation clamps the data to 1 or less.
     */
    var SourceAlphaSat = 11;

    /**
     * The blend factor is the blend factor set with `ID3D11DeviceContext::OMSetBlendState`.
     * No pre-blend operation.
     */
    var BlendFactor = 14;

    /**
     * The blend factor is the blend factor set with `ID3D11DeviceContext::OMSetBlendState`.
     * The pre-blend operation inverts the blend factor, generating 1 - blend_factor.
     */
    var InverseBlendFactor = 15;

    /**
     * The blend factor is data sources both as color data output by a pixel shader.
     * There is no pre-blend operation. This blend factor supports dual-source color blending.
     */
    var Source1Color = 16;

    /**
     * The blend factor is data sources both as color data output by a pixel shader.
     * The pre-blend operation inverts the data, generating 1 - RGB.
     * This blend factor supports dual-source color blending.
     */
    var InverseSource1Color = 17;

    /**
     * The blend factor is data sources as alpha data output by a pixel shader.
     * There is no pre-blend operation. This blend factor supports dual-source color blending.
     */
    var Source1Alpha = 18;

    /**
     * The blend factor is data sources as alpha data output by a pixel shader.
     * The pre-blend operation inverts the data, generating 1 - A. This blend factor supports dual-source color blending.
     */
    var InverseSource1Alpha = 19;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_BLEND')
extern class NativeD3D11Blend
{
    //
}
