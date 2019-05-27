package d3d11.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Pointer;
import cpp.Star;

class D3d11RenderTargetViewDescription
{
    public final backing : Star<NativeD3D11RenderTargetViewDescription>;

    public function new(_existing : Pointer<NativeD3D11RenderTargetViewDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11RenderTargetViewDescription.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    @:void
    static function finalize(_obj : D3d11RenderTargetViewDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_RENDER_TARGET_VIEW_DESC')
extern class NativeD3D11RenderTargetViewDescription
{
    @:native('new D3D11_RENDER_TARGET_VIEW_DESC')
    static function createPtr() : Star<NativeD3D11RenderTargetViewDescription>;

    @:native('D3D11_RENDER_TARGET_VIEW_DESC')
    static function createRef() : NativeD3D11RenderTargetViewDescription;
}
