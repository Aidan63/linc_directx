package d3d11.structures;

import cpp.Star;
import cpp.Pointer;
import cpp.Function;
import cpp.vm.Gc;
import d3d11.enumerations.D3d11Blend;
import d3d11.enumerations.D3d11BlendOp;

/**
 * Describes the blend state for a render target.
 */
class D3d11RenderTargetBlendDescription
{
    public final backing : Star<NativeD3D11RenderTargetBlendDescription>;

    /**
     * Enable (or disable) blending.
     */
    public var blendEnable (get, set) : Bool;
    
    function get_blendEnable() : Bool return backing.blendEnable;
    
    function set_blendEnable(_v : Bool) : Bool return backing.blendEnable = _v;

    /**
     * This blend option specifies the operation to perform on the RGB value that the pixel shader outputs.
     * The BlendOp member defines how to combine the SrcBlend and DestBlend operations.
     */
    public var srcBlend (get, set) : D3d11Blend;
    
    function get_srcBlend() : D3d11Blend return cast backing.srcBlend;
    
    function set_srcBlend(_v : D3d11Blend) : D3d11Blend
    {
        backing.srcBlend = cast _v;

        return _v;
    }

    /**
     * This blend option specifies the operation to perform on the current RGB value in the render target.
     * The BlendOp member defines how to combine the SrcBlend and DestBlend operations.
     */
    public var destBlend (get, set) : D3d11Blend;
    
    function get_destBlend() : D3d11Blend return cast backing.destBlend;
    
    function set_destBlend(_v : D3d11Blend) : D3d11Blend
    {
        backing.destBlend = cast _v;

        return _v;
    }

    /**
     * This blend operation defines how to combine the SrcBlend and DestBlend operations.
     */
    public var blendOp (get, set) : D3d11BlendOp;
    
    function get_blendOp() : D3d11BlendOp return cast backing.blendOp;
    
    function set_blendOp(_v : D3d11BlendOp) : D3d11BlendOp
    {
        backing.blendOp = cast _v;

        return _v;
    }

    /**
     * This blend option specifies the operation to perform on the alpha value that the pixel shader outputs.
     * Blend options that end in _COLOR are not allowed.
     * The BlendOpAlpha member defines how to combine the SrcBlendAlpha and DestBlendAlpha operations.
     */
    public var srcBlendAlpha (get, set) : D3d11Blend;
    
    function get_srcBlendAlpha() : D3d11Blend return cast backing.srcBlendAlpha;
    
    function set_srcBlendAlpha(_v : D3d11Blend) : D3d11Blend
    {
        backing.srcBlendAlpha = cast _v;

        return _v;
    }

    /**
     * This blend option specifies the operation to perform on the current alpha value in the render target.
     * Blend options that end in _COLOR are not allowed.
     * The BlendOpAlpha member defines how to combine the SrcBlendAlpha and DestBlendAlpha operations.
     */
    public var destBlendAlpha (get, set) : D3d11Blend;
    
    function get_destBlendAlpha() : D3d11Blend return cast backing.destBlendAlpha;
    
    function set_destBlendAlpha(_v : D3d11Blend) : D3d11Blend
    {
        backing.destBlendAlpha = cast _v;

        return _v;
    }

    /**
     * This blend operation defines how to combine the SrcBlendAlpha and DestBlendAlpha operations.
     */
    public var blendOpAlpha (get, set) : D3d11BlendOp;
    
    function get_blendOpAlpha() : D3d11BlendOp return cast backing.blendOpAlpha;
    
    function set_blendOpAlpha(_v : D3d11BlendOp) : D3d11BlendOp
    {
        backing.blendOpAlpha = cast _v;

        return _v;
    }

    /**
     * A write mask.
     */
    public var renderTargetWriteMask(get, set):Int;
    
    function get_renderTargetWriteMask() : Int return cast backing.renderTargetWriteMask;
    
    function set_renderTargetWriteMask(_v : Int) : Int
    {
        backing.renderTargetWriteMask = cast _v;

        return _v;
    }

    public function new(_existing : Pointer<NativeD3D11RenderTargetBlendDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11RenderTargetBlendDescription.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    @:void
    static function finalize(_obj : D3d11RenderTargetBlendDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_RENDER_TARGET_BLEND_DESC')
extern class NativeD3D11RenderTargetBlendDescription
{
    @:native('D3D11_RENDER_TARGET_BLEND_DESC')
    static function createRef() : NativeD3D11RenderTargetBlendDescription;

    @:native('new D3D11_RENDER_TARGET_BLEND_DESC')
    static function createPtr() : Star<NativeD3D11RenderTargetBlendDescription>;

    @:native('BlendEnable')
    var blendEnable : Bool;

    @:native('SrcBlend')
    var srcBlend : NativeD3D11Blend;

    @:native('DestBlend')
    var destBlend : NativeD3D11Blend;

    @:native('BlendOp')
    var blendOp : NativeD3D11BlendOp;

    @:native('SrcBlendAlpha')
    var srcBlendAlpha : NativeD3D11Blend;

    @:native('DestBlendAlpha')
    var destBlendAlpha : NativeD3D11Blend;

    @:native('BlendOpAlpha')
    var blendOpAlpha : NativeD3D11BlendOp;

    @:native('RenderTargetWriteMask')
    var renderTargetWriteMask : cpp.UInt8;
}
