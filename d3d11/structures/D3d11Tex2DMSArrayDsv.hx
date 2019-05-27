package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;

/**
 * Specifies the subresources from an array 2D textures that are accessible to a depth-stencil view.
 */
class D3d11Tex2DMSArrayDsv
{
    public final backing : Star<NativeD3D11Tex2DMSArrayDsv>;

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

    public function new(_existing : Pointer<NativeD3D11Tex2DMSArrayDsv> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Tex2DMSArrayDsv.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    @:void
    static function finalize(_obj : D3d11Tex2DMSArrayDsv)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEX2DMS_ARRAY_DSV')
extern class NativeD3D11Tex2DMSArrayDsv
{
    @:native('new D3D11_TEX2DMS_ARRAY_DSV')
    static function createPtr() : Star<NativeD3D11Tex2DMSArrayDsv>;

    @:native('D3D11_TEX2DMS_ARRAY_DSV')
    static function createRef() : NativeD3D11Tex2DMSArrayDsv;

    @:native('FirstArraySlice')
    var firstArraySlice : cpp.UInt32;

    @:native('ArraySize')
    var arraySize : cpp.UInt32;
}
