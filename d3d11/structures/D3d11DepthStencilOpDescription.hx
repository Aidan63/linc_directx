package d3d11.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Pointer;
import cpp.Star;
import d3d11.enumerations.D3d11StencilOp;
import d3d11.enumerations.D3d11ComparisonFunction;

/**
 * Stencil operations that can be performed based on the results of stencil test.
 */
class D3d11DepthStencilOpDescription
{
    public final backing : Star<NativeD3D11DepthStencilOpDescription>;

    /**
     * The stencil operation to perform when stencil testing fails.
     */
    public var stencilFailOp (get, set) : D3d11StencilOp;

    inline function get_stencilFailOp() : D3d11StencilOp return cast backing.stencilFailOp;

    inline function set_stencilFailOp(_v : D3d11StencilOp) : D3d11StencilOp
    {
        backing.stencilFailOp = cast _v;

        return _v;
    }

    /**
     * The stencil operation to perform when stencil testing passes and depth testing fails.
     */
    public var stencilDepthFailOp (get, set) : D3d11StencilOp;

    inline function get_stencilDepthFailOp() : D3d11StencilOp return cast backing.stencilDepthFailOp;

    inline function set_stencilDepthFailOp(_v : D3d11StencilOp) : D3d11StencilOp
    {
        backing.stencilDepthFailOp = cast _v;

        return _v;
    }

    /**
     * The stencil operation to perform when stencil testing and depth testing both pass.
     */
    public var stencilPassOp (get, set) : D3d11StencilOp;

    inline function get_stencilPassOp() : D3d11StencilOp return cast backing.stencilPassOp;

    inline function set_stencilPassOp(_v : D3d11StencilOp) : D3d11StencilOp
    {
        backing.stencilPassOp = cast _v;

        return _v;
    }

    /**
     * A function that compares stencil data against existing stencil data. The function options are listed in `D3D11_COMPARISON_FUNC`.
     */
    public var stencilFunction (get, set) : D3d11ComparisonFunction;

    inline function get_stencilFunction() : D3d11ComparisonFunction return cast backing.stencilFunction;

    inline function set_stencilFunction(_v : D3d11ComparisonFunction) : D3d11ComparisonFunction
    {
        backing.stencilFunction = cast _v;

        return _v;
    }

    public function new(_existing : Pointer<NativeD3D11DepthStencilOpDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11DepthStencilOpDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalise));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalise(_obj : D3d11DepthStencilOpDescription)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DEPTH_STENCILOP_DESC')
extern class NativeD3D11DepthStencilOpDescription
{
    @:native('new D3D11_DEPTH_STENCILOP_DESC')
    static function createPtr() : Star<NativeD3D11DepthStencilOpDescription>;

    @:native('D3D11_DEPTH_STENCILOP_DESC')
    static function createRef() : NativeD3D11DepthStencilOpDescription;

    @:native('StencilFailOp')
    var stencilFailOp : NativeD3D11StencilOp;

    @:native('StencilDepthFailOp')
    var stencilDepthFailOp : NativeD3D11StencilOp;

    @:native('StencilPassOp')
    var stencilPassOp : NativeD3D11StencilOp;

    @:native('StencilFunc')
    var stencilFunction : NativeD3D11ComparisonFunction;
}
