package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;
import dxgi.structures.DxgiSampleDescription;
import dxgi.enumerations.DxgiFormat;
import d3d11.enumerations.D3d11Usage;

/**
 * Describes a 2D texture.
 */
class D3d11Texture2DDescription
{
    public final backing : Star<NativeD3D11Texture2DDescription>;

    /**
     * Texture width (in texels). The range is from 1 to `D3D11_REQ_TEXTURE2D_U_OR_V_DIMENSION` (16384).
     * For a texture cube-map, the range is from 1 to `D3D11_REQ_TEXTURECUBE_DIMENSION` (16384). However, the range is actually constrained by the feature level at which you create the rendering device.
     * For more information about restrictions, see Remarks.
     */
    public var width (get, set) : Int;

    inline function get_width() : Int return backing.width;

    inline function set_width(_v : Int) : Int return backing.width = _v;

    /**
     * Texture height (in texels). The range is from 1 to `D3D11_REQ_TEXTURE2D_U_OR_V_DIMENSION` (16384).
     * For a texture cube-map, the range is from 1 to `D3D11_REQ_TEXTURECUBE_DIMENSION` (16384). However, the range is actually constrained by the feature level at which you create the rendering device.
     * For more information about restrictions, see Remarks.
     */
    public var height (get, set) : Int;

    inline function get_height() : Int return backing.height;

    inline function set_height(_v : Int) : Int return backing.height = _v;

    /**
     * The maximum number of mipmap levels in the texture. See the remarks in `D3D11_TEX1D_SRV`.
     * Use 1 for a multisampled texture; or 0 to generate a full set of subtextures.
     */
    public var mipLevels (get, set) : Int;

    inline function get_mipLevels() : Int return backing.mipLevels;

    inline function set_mipLevels(_v : Int) : Int return backing.mipLevels = _v;

    /**
     * Number of textures in the texture array. The range is from 1 to `D3D11_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION` (2048).
     * For a texture cube-map, this value is a multiple of 6 (that is, 6 times the value in the NumCubes member of `D3D11_TEXCUBE_ARRAY_SRV`), and the range is from 6 to 2046.
     * The range is actually constrained by the feature level at which you create the rendering device. For more information about restrictions, see Remarks.
     */
    public var arraySize (get, set) : Int;

    inline function get_arraySize() : Int return backing.arraySize;

    inline function set_arraySize(_v : Int) : Int return backing.arraySize = _v;

    /**
     * Texture format (see `DXGI_FORMAT`).
     */
    public var format (get, set) : DxgiFormat;

    inline function get_format() : DxgiFormat return cast backing.format;

    inline function set_format(_v : DxgiFormat) : DxgiFormat
    {
        backing.format = cast _v;

        return _v;
    }

    /**
     * Structure that specifies multisampling parameters for the texture. See `DXGI_SAMPLE_DESC`.
     */
    public final sampleDesc : DxgiSampleDescription;

    /**
     * Value that identifies how the texture is to be read from and written to.
     * The most common value is `D3D11_USAGE_DEFAULT`; see `D3D11_USAGE` for all possible values.
     */
    public var usage (get, set) : D3d11Usage;

    inline function get_usage() : D3d11Usage return cast backing.usage;

    inline function set_usage(_v : D3d11Usage) : D3d11Usage
    {
        backing.usage = cast _v;

        return _v;
    }

    /**
     * Flags (see `D3D11_BIND_FLAG`) for binding to pipeline stages. The flags can be combined by a logical OR.
     */
    public var bindFlags (get, set) : Int;

    inline function get_bindFlags() : Int return backing.bindFlags;

    inline function set_bindFlags(_v : Int) : Int return backing.bindFlags = _v;

    /**
     * Flags (see `D3D11_CPU_ACCESS_FLAG`) to specify the types of CPU access allowed.
     * Use 0 if CPU access is not required. These flags can be combined with a logical OR.
     */
    public var cpuAccessFlags (get, set) : Int;

    inline function get_cpuAccessFlags() : Int return backing.cpuAccessFlags;

    inline function set_cpuAccessFlags(_v : Int) : Int return backing.cpuAccessFlags = _v;

    /**
     * Flags (see `D3D11_RESOURCE_MISC_FLAG`) that identify other, less common resource options.
     * Use 0 if none of these flags apply.
     * These flags can be combined by using a logical OR. For a texture cube-map, set the `D3D11_RESOURCE_MISC_TEXTURECUBE` flag.
     * Cube-map arrays (that is, ArraySize > 6) require feature level `D3D_FEATURE_LEVEL_10_1` or higher.
     */
    public var miscFlags (get, set) : Int;

    inline function get_miscFlags() : Int return backing.miscFlags;

    inline function set_miscFlags(_v : Int) : Int return backing.miscFlags = _v;

    public function new(_existing : Pointer<NativeD3D11Texture2DDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Texture2DDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        sampleDesc = new DxgiSampleDescription(Pointer.addressOf(backing.sampleDesc));
    }

    @:void
    static function finalize(_obj : D3d11Texture2DDescription)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEXTURE2D_DESC')
extern class NativeD3D11Texture2DDescription
{
    @:native('new D3D11_TEXTURE2D_DESC')
    static function createPtr() : Star<NativeD3D11Texture2DDescription>;

    @:native('D3D11_TEXTURE2D_DESC')
    static function createRef() : NativeD3D11Texture2DDescription;

    @:native('Width')
    var width : cpp.UInt32;

    @:native('Height')
    var height : cpp.UInt32;

    @:native('MipLevels')
    var mipLevels : cpp.UInt32;

    @:native('ArraySize')
    var arraySize : cpp.UInt32;

    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('SampleDesc')
    var sampleDesc : NativeDXGISampleDescription;

    @:native('Usage')
    var usage : NativeD3D11Usage;

    @:native('BindFlags')
    var bindFlags : cpp.UInt32;

    @:native('CPUAccessFlags')
    var cpuAccessFlags : cpp.UInt32;

    @:native('MiscFlags')
    var miscFlags : cpp.UInt32;
}
