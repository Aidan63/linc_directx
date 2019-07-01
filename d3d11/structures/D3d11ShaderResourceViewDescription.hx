package d3d11.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Pointer;
import cpp.Star;

class D3d11ShaderResourceViewDescription
{
    public final backing : Star<NativeD3D11ShaderResourceViewDescription>;

    public function new(_existing : Pointer<NativeD3D11ShaderResourceViewDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11ShaderResourceViewDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11ShaderResourceViewDescription)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_SHADER_RESOURCE_VIEW_DESC')
extern class NativeD3D11ShaderResourceViewDescription
{
    @:native('new D3D11_SHADER_RESOURCE_VIEW_DESC')
    static function createPtr() : Star<NativeD3D11ShaderResourceViewDescription>;

    @:native('D3D11_SHADER_RESOURCE_VIEW_DESC')
    static function createRef() : NativeD3D11ShaderResourceViewDescription;
}
