package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;
import haxe.io.BytesData;

/**
 * Specifies data for initializing a subresource.
 */
class D3d11SubResourceData
{
    public final backing : Star<NativeD3D11SubResourceData>;

    /**
     * Pointer to the initialization data.
     */
    @:isVar public var systemMemory (get, set) : BytesData;

    inline function get_systemMemory() : BytesData return systemMemory;

    inline function set_systemMemory(_v : BytesData) : BytesData
    {
        systemMemory = _v;

        backing.systemMemory = (Pointer.arrayElem(systemMemory, 0).reinterpret() : Pointer<cpp.Void>).ptr;

        return _v;
    }

    /**
     * The distance (in bytes) from the beginning of one line of a texture to the next line.
     * 
     * System-memory pitch is used only for 2D and 3D texture data as it is has no meaning for the other resource types.
     * Specify the distance from the first pixel of one 2D slice of a 3D texture to the first pixel of the next 2D slice in that texture in the SysMemSlicePitch member.
     */
    public var systemMemoryPitch (get, set) : Int;

    inline function get_systemMemoryPitch() : Int return backing.systemMemoryPitch;

    inline function set_systemMemoryPitch(_v : Int) : Int return backing.systemMemoryPitch = _v;

    /**
     * The distance (in bytes) from the beginning of one depth level to the next.
     * System-memory-slice pitch is only used for 3D texture data as it has no meaning for the other resource types.
     */
    public var systemMemorySlicePatch (get, set) : Int;

    inline function get_systemMemorySlicePatch() : Int return backing.systemMemorySlicePatch;

    inline function set_systemMemorySlicePatch(_v : Int) : Int return backing.systemMemorySlicePatch = _v;

    public function new(_existing : Pointer<NativeD3D11SubResourceData> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11SubResourceData.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11SubResourceData)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_SUBRESOURCE_DATA')
extern class NativeD3D11SubResourceData
{
    @:native('D3D11_SUBRESOURCE_DATA')
    static function createRef() : NativeD3D11SubResourceData;

    @:native('new D3D11_SUBRESOURCE_DATA')
    static function createPtr() : Star<NativeD3D11SubResourceData>;

    @:native('pSysMem')
    var systemMemory : Star<cpp.Void>;

    @:native('SysMemPitch')
    var systemMemoryPitch : cpp.UInt32;

    @:native('SysMemSlicePitch')
    var systemMemorySlicePatch : cpp.UInt32;
}
