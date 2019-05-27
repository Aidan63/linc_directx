package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.RawPointer;
import cpp.vm.Gc;

/**
 * Provides access to subresource data.
 */
class D3d11MappedSubResource
{
    public final backing : Star<NativeD3D11MappedSubResource>;

    /**
     * Pointer to the data. When `ID3D11DeviceContext::Map` provides the pointer, the runtime ensures that the pointer has a specific alignment, depending on the following feature levels:
     * - For `D3D_FEATURE_LEVEL_10_0` and higher, the pointer is aligned to 16 bytes.
     * - For lower than `D3D_FEATURE_LEVEL_10_0`, the pointer is aligned to 4 bytes.
     */
    public var data (get, set) : Pointer<cpp.Void>;

    inline function get_data() : Pointer<cpp.Void> return Pointer.fromRaw(backing.data);

    inline function set_data(_v : Pointer<cpp.Void>) : Pointer<cpp.Void>
    {
        backing.data = _v.raw;

        return _v;
    }

    /**
     * The row pitch, or width, or physical size (in bytes) of the data.
     */
    public var rowPitch (get, set) : Int;

    inline function get_rowPitch() : Int return backing.rowPitch;

    inline function set_rowPitch(_v : Int) : Int return backing.rowPitch = _v;

    /**
     * The depth pitch, or width, or physical size (in bytes)of the data.
     */
    public var depthPitch (get, set) : Int;

    inline function get_depthPitch() : Int return backing.depthPitch;

    inline function set_depthPitch(_v : Int) : Int return backing.depthPitch = _v;

    public function new(_existing : Pointer<NativeD3D11MappedSubResource> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11MappedSubResource.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalise));
    }

    @:void
    static function finalise(_obj : D3d11MappedSubResource)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_MAPPED_SUBRESOURCE')
extern class NativeD3D11MappedSubResource
{
    @:native('new D3D11_MAPPED_SUBRESOURCE')
    static function createPtr() : Star<NativeD3D11MappedSubResource>;

    @:native('D3D11_MAPPED_SUBRESOURCE')
    static function createRef() : NativeD3D11MappedSubResource;
    
    @:native('pData')
    var data : RawPointer<cpp.Void>;

    @:native('RowPitch')
    var rowPitch : cpp.UInt32;

    @:native('DepthPitch')
    var depthPitch : cpp.UInt32;
}
