package dxgi.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Star;
import cpp.Pointer;

/**
 * Describes multi-sampling parameters for a resource.
 * 
 * This structure is a member of the `DXGI_SWAP_CHAIN_DESC1` structure.
 * The default sampler mode, with no anti-aliasing, has a count of 1 and a quality level of 0.
 * 
 * If multi-sample antialiasing is being used, all bound render targets and depth buffers must have the same sample counts and quality levels.
 */
class DxgiSampleDescription
{
    /**
     * Native DXGI struct.
     */
    public final backing : Star<NativeDXGISampleDescription>;

    /**
     * The number of multisamples per pixel.
     */
    public var count (get, set) : Int;

    inline function get_count() : Int return backing.count;

    inline function set_count(_v : Int) : Int return backing.count = _v;

    /**
     * The image quality level.
     * The higher the quality, the lower the performance.
     * The valid range is between zero and one less than the level returned by `ID3D10Device::CheckMultisampleQualityLevels` for Direct3D 10 or `ID3D11Device::CheckMultisampleQualityLevels` for Direct3D 11.
     * 
     * For Direct3D 10.1 and Direct3D 11, you can use two special quality level values.
     * For more information about these quality level values, see Remarks.
     */
    public var quality (get, set) : Int;

    inline function get_quality() : Int return backing.quality;

    inline function set_quality(_v : Int) : Int return backing.quality = _v;

    /**
     * Create a new sample description.
     * @param _existing Existing native dxgi sample description struct, one will be created if not provided.
     */
    public function new(_existing : Pointer<NativeDXGISampleDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGISampleDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : DxgiSampleDescription)
    {
        Pointer.fromStar(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_SAMPLE_DESC')
extern class NativeDXGISampleDescription
{
    @:native('DXGI_SAMPLE_DESC')
    static function createRef() : NativeDXGISampleDescription;

    @:native('new DXGI_SAMPLE_DESC')
    static function createPtr() : Star<NativeDXGISampleDescription>;

    @:native('Count')
    var count : cpp.UInt32;

    @:native('Quality')
    var quality : cpp.UInt32;
}
