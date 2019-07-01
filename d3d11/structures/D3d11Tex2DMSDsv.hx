package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;

/**
 * Specifies the subresource from a multisampled 2D texture that is accessible to a depth-stencil view.
 */
class D3d11Tex2DMSDsv
{
    public final backing : Star<NativeD3D11Tex2DMSDsv>;

    /**
     * The index of the first mipmap level to use.
     */
    public var unusedFieldNothingToDefine (get, set) : Int;

    inline function get_unusedFieldNothingToDefine() : Int return backing.unusedFieldNothingToDefine;

    inline function set_unusedFieldNothingToDefine(_v : Int) : Int return backing.unusedFieldNothingToDefine = _v;

    public function new(_existing : Pointer<NativeD3D11Tex2DMSDsv> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Tex2DMSDsv.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11Tex2DMSDsv)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEX2DMS_DSV')
extern class NativeD3D11Tex2DMSDsv
{
    @:native('new D3D11_TEX2DMS_DSV')
    static function createPtr() : Star<NativeD3D11Tex2DMSDsv>;

    @:native('D3D11_TEX2DMS_DSV')
    static function createRef() : NativeD3D11Tex2DMSDsv;

    @:native('UnusedField_NothingToDefine')
    var unusedFieldNothingToDefine : cpp.UInt32;
}
