package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;

/**
 * Specifies the subresource from a 1D texture that is accessible to a depth-stencil view.
 */
class D3d11Tex1DDsv
{
    public final backing : Star<NativeD3D11Tex1DDsv>;

    /**
     * The index of the first mipmap level to use.
     */
    public var mipSlice (get, set) : Int;

    inline function get_mipSlice() : Int return backing.mipSlice;

    inline function set_mipSlice(_v : Int) : Int return backing.mipSlice = _v;

    public function new(_existing : Pointer<NativeD3D11Tex1DDsv> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Tex1DDsv.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11Tex1DDsv)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEX1D_DSV')
extern class NativeD3D11Tex1DDsv
{
    @:native('new D3D11_TEX1D_DSV')
    static function createPtr() : Star<NativeD3D11Tex1DDsv>;

    @:native('D3D11_TEX1D_DSV')
    static function createRef() : NativeD3D11Tex1DDsv;

    @:native('MipSlice')
    var mipSlice : cpp.UInt32;
}
