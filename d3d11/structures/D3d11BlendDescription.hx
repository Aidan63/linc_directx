package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;
import d3d11.structures.D3d11RenderTargetBlendDescription;

/**
 * Describes the blend state that you use in a call to `ID3D11Device::CreateBlendState` to create a blend-state object.
 */
class D3d11BlendDescription
{
    public final backing : Star<NativeD3D11BlendDescription>;

    /**
     * Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target.
     * For more info about using alpha-to-coverage, see Alpha-To-Coverage.
     */
    public var alphaToCoverageEnable (get, set) : Bool;
    
    function get_alphaToCoverageEnable() : Bool return backing.alphaToCoverageEnable;
    
    function set_alphaToCoverageEnable(_v : Bool) : Bool return backing.alphaToCoverageEnable = _v;

    /**
     * Specifies whether to enable independent blending in simultaneous render targets. Set to TRUE to enable independent blending.
     * If set to FALSE, only the RenderTarget[0] members are used; RenderTarget[1..7] are ignored.
     */
    public var independentBlendEnable(get, set):Bool;
    
    function get_independentBlendEnable() : Bool return backing.independentBlendEnable;
    
    function set_independentBlendEnable(_v : Bool) : Bool return backing.independentBlendEnable = _v;

    /**
     * An array of `D3D11_RENDER_TARGET_BLEND_DESC` structures that describe the blend states for render targets;
     * these correspond to the eight render targets that can be bound to the output-merger stage at one time.
     */
    public final renderTarget : Array<D3d11RenderTargetBlendDescription>;

    public function new(_existing : Pointer<NativeD3D11BlendDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11BlendDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        renderTarget = [ for (i in 0...8) new D3d11RenderTargetBlendDescription(Pointer.addressOf(backing.renderTarget[i])) ];
    }

    @:void
    static function finalize(_obj : D3d11BlendDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_BLEND_DESC')
extern class NativeD3D11BlendDescription
{
    @:native('new D3D11_BLEND_DESC')
    static function createPtr() : Star<NativeD3D11BlendDescription>;

    @:native('D3D11_BLEND_DESC')
    static function createRef() : NativeD3D11BlendDescription;

    @:native('AlphaToCoverageEnable')
    var alphaToCoverageEnable : Bool;

    @:native('IndependentBlendEnable')
    var independentBlendEnable : Bool;

    @:native('RenderTarget')
    var renderTarget : cpp.RawPointer<NativeD3D11RenderTargetBlendDescription>;
}
