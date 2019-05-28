package d3dcommon.enumerations;

/**
 * Describes the set of features targeted by a Direct3D device.
 */
enum abstract D3dFeatureLevel(Int) to Int
{
    /**
     * Targets features supported by [feature level](/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro) 9.1, including shader model 2.
     */
    var Level9_1 = 0x9100;

    /**
     * Targets features supported by [feature level](/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro) 9.2, including shader model 2.
     */
    var Level9_2 = 0x9200;

    /**
     * Targets features supported by [feature level](/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro) 9.3, including shader model 2.0b.
     */
    var Level9_3 = 0x9300;

    /**
     * Targets features supported by Direct3D 10.0, including shader model 4.
     */
    var Level10_0 = 0xa000;

    /**
     * Targets features supported by Direct3D 10.1, including shader model 4.
     */
    var Level10_1 = 0xa100;

    /**
     * Targets features supported by Direct3D 11.0, including shader model 5.
     */
    var Level11_0 = 0xb000;

    /**
     * Targets features supported by Direct3D 11.1, including shader model 5 and logical blend operations.
     * This feature level requires a display driver that is at least implemented to WDDM for Windows 8 (WDDM 1.2).
     */
    var Level11_1 = 0xb100;

    /**
     * Targets features supported by Direct3D 12.0, including shader model 5.
     */
    var Level12_0 = 0xc000;

    /**
     * Targets features supported by Direct3D 12.1, including shader model 5.
     */
    var Level12_1 = 0xc100;
}

@:keep
@:unreflective
@:include('d3dcommon.h')
@:native('D3D_FEATURE_LEVEL')
extern class NativeD3DFeatureLevel
{
    //
}
