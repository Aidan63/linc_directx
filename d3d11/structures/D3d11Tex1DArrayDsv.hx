package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;

/**
 * Specifies the subresource from a 1D texture that is accessible to a depth-stencil view.
 */
class D3d11Tex1DArrayDsv
{
    public final backing : Star<NativeD3D11Tex1DArrayDsv>;

    /**
     * The index of the first mipmap level to use.
     */
    public var mipSlice (get, set) : Int;

    inline function get_mipSlice() : Int return backing.mipSlice;

    inline function set_mipSlice(_v : Int) : Int return backing.mipSlice = _v;

    /**
     * The index of the first texture to use in an array of textures.
     */
    public var firstArraySlice (get, set) : Int;

    inline function get_firstArraySlice() : Int return backing.firstArraySlice;

    inline function set_firstArraySlice(_v : Int) : Int return backing.firstArraySlice = _v;

    /**
     * Number of textures to use.
     */
    public var arraySize (get, set) : Int;

    inline function get_arraySize() : Int return backing.arraySize;

    inline function set_arraySize(_v : Int) : Int return backing.arraySize;

    public function new(_existing : Pointer<NativeD3D11Tex1DArrayDsv> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Tex1DArrayDsv.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11Tex1DArrayDsv)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEX1D_ARRAY_DSV')
extern class NativeD3D11Tex1DArrayDsv
{
    @:native('new D3D11_TEX1D_ARRAY_DSV')
    static function createPtr() : Star<NativeD3D11Tex1DArrayDsv>;

    @:native('D3D11_TEX1D_ARRAY_DSV')
    static function createRef() : NativeD3D11Tex1DArrayDsv;

    @:native('MipSlice')
    var mipSlice : cpp.UInt32;

    @:native('FirstArraySlice')
    var firstArraySlice : cpp.UInt32;

    @:native('ArraySize')
    var arraySize : cpp.UInt32;
}
