package d3d11.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.RawPointer;
import d3d11.enumerations.D3d11ComparisonFunction;
import d3d11.enumerations.D3d11TextureAddressMode;
import d3d11.enumerations.D3d11Filter;
import cpp.Pointer;
import cpp.Star;

/**
 * Describes a sampler state.
 */
class D3d11SamplerDescription
{
    public final backing : Star<NativeD3D11SamplerDescription>;

    /**
     * Filtering method to use when sampling a texture (see `D3D11_FILTER`).
     */
    public var filter (get, set) : D3d11Filter;

    inline function get_filter() : D3d11Filter return cast backing.filter;

    inline function set_filter(_v : D3d11Filter) : D3d11Filter
    {
        backing.filter = cast _v;

        return _v;
    }

    /**
     * Method to use for resolving a u texture coordinate that is outside the 0 to 1 range (see `D3D11_TEXTURE_ADDRESS_MODE`).
     */
    public var addressU (get, set) : D3d11TextureAddressMode;

    inline function get_addressU() : D3d11TextureAddressMode return cast backing.addressU;

    inline function set_addressU(_v : D3d11TextureAddressMode) : D3d11TextureAddressMode
    {
        backing.addressU = cast _v;

        return _v;
    }

    /**
     * Method to use for resolving a v texture coordinate that is outside the 0 to 1 range.
     */
    public var addressV (get, set) : D3d11TextureAddressMode;

    inline function get_addressV() : D3d11TextureAddressMode return cast backing.addressV;

    inline function set_addressV(_v : D3d11TextureAddressMode) : D3d11TextureAddressMode
    {
        backing.addressV = cast _v;

        return _v;
    }

    /**
     * Method to use for resolving a w texture coordinate that is outside the 0 to 1 range.
     */
    public var addressW (get, set) : D3d11TextureAddressMode;

    inline function get_addressW() : D3d11TextureAddressMode return cast backing.addressW;

    inline function set_addressW(_v : D3d11TextureAddressMode) : D3d11TextureAddressMode
    {
        backing.addressW = cast _v;

        return _v;
    }

    /**
     * Offset from the calculated mipmap level.
     * For example, if Direct3D calculates that a texture should be sampled at mipmap level 3 and MipLODBias is 2, then the texture will be sampled at mipmap level 5.
     */
    public var mipLodBias (get, set) : Float;

    inline function get_mipLodBias() : Float return backing.mipLodBias;

    inline function set_mipLodBias(_v : Float) : Float return backing.mipLodBias = _v;

    /**
     * Clamping value used if `D3D11_FILTER_ANISOTROPIC` or `D3D11_FILTER_COMPARISON_ANISOTROPIC` is specified in Filter.
     * Valid values are between 1 and 16.
     */
    public var maxAnisotropy (get, set) : Int;

    inline function get_maxAnisotropy() : Int return backing.maxAnisotropy;

    inline function set_maxAnisotropy(_v : Int) : Int return backing.maxAnisotropy = _v;

    /**
     * A function that compares sampled data against existing sampled data. The function options are listed in `D3D11_COMPARISON_FUNC`.
     */
    public var comparisonFunc (get, set) : D3d11ComparisonFunction;

    inline function get_comparisonFunc() : D3d11ComparisonFunction return cast backing.comparisonFunc;

    inline function set_comparisonFunc(_v : D3d11ComparisonFunction) : D3d11ComparisonFunction
    {
        backing.comparisonFunc = cast _v;

        return _v;
    }

    /**
     * Border color to use if `D3D11_TEXTURE_ADDRESS_BORDER` is specified for AddressU, AddressV, or AddressW. Range must be between 0.0 and 1.0 inclusive.
     */
    public final borderColor : Pointer<cpp.Float32>;

    /**
     * Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     */
    public var minLod (get, set) : Float;

    inline function get_minLod() : Float return backing.minLod;

    inline function set_minLod(_v : Float) : Float return backing.minLod = _v;

    /**
     * Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     * This value must be greater than or equal to MinLOD.
     * To have no upper limit on LOD set this to a large value such as `D3D11_FLOAT32_MAX`.
     */
    public var maxLod (get, set) : Float;

    inline function get_maxLod() : Float return backing.maxLod;

    inline function set_maxLod(_v : Float) : Float return backing.maxLod = _v;

    public function new(_existing : Pointer<NativeD3D11SamplerDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11SamplerDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        borderColor = Pointer.fromRaw(backing.borderColor);
    }

    @:void
    static function finalize(_obj : D3d11SamplerDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_SAMPLER_DESC')
extern class NativeD3D11SamplerDescription
{
    @:native('new D3D11_SAMPLER_DESC')
    static function createPtr() : Star<NativeD3D11SamplerDescription>;

    @:native('D3D11_SAMPLER_DESC')
    static function createRef() : NativeD3D11SamplerDescription;

    @:native('Filter')
    var filter : NativeD3D11Filter;

    @:native('AddressU')
    var addressU : NativeD3D11TextureAddressMode;

    @:native('AddressV')
    var addressV : NativeD3D11TextureAddressMode;

    @:native('AddressW')
    var addressW : NativeD3D11TextureAddressMode;

    @:native('MipLODBias')
    var mipLodBias : cpp.Float32;

    @:native('MaxAnisotropy')
    var maxAnisotropy : cpp.UInt32;

    @:native('ComparisonFunc')
    var comparisonFunc : NativeD3D11ComparisonFunction;

    @:native('BorderColor')
    var borderColor : RawPointer<cpp.Float32>;

    @:native('MinLOD')
    var minLod : cpp.Float32;

    @:native('MaxLOD')
    var maxLod : cpp.Float32;
}
