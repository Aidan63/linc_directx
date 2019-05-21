package d3d11.structures;

import cpp.Pointer;
import cpp.Star;
import d3d11.enumerations.D3d11Usage;

/**
 * Describes a buffer resource.
 */
class D3d11BufferDescription
{
    public final backing : Star<NativeD3D11BufferDescription>;

    /**
     * Size of the buffer in bytes.
     */
    public var byteWidth (get, set) : Int;

    inline function get_byteWidth() : Int return backing.byteWidth;

    inline function set_byteWidth(_v : Int) : Int return backing.byteWidth = _v;
    
    /**
     * Identify how the buffer is expected to be read from and written to.
     * Frequency of update is a key factor.
     * The most common value is typically `D3D11_USAGE_DEFAULT`; see `D3D11_USAGE` for all possible values.
     */
    public var usage (get, set) : D3d11Usage;

    inline function get_usage() : D3d11Usage return cast backing.usage;

    inline function set_usage(_v : D3d11Usage) : D3d11Usage
    {
        backing.usage = cast _v;

        return _v;
    }

    /**
     * Identify how the buffer will be bound to the pipeline.
     * Flags (see `D3D11_BIND_FLAG`) can be combined with a logical OR.
     */
    public var bindFlags (get, set) : Int;

    inline function get_bindFlags() : Int return backing.bindFlags;

    inline function set_bindFlags(_v : Int) : Int return backing.bindFlags = _v;

    /**
     * CPU access flags (see `D3D11_CPU_ACCESS_FLAG`) or 0 if no CPU access is necessary.
     * Flags can be combined with a logical OR.
     */
    public var cpuAccessFlags (get, set) : Int;

    inline function get_cpuAccessFlags() : Int return backing.cpuAccessFlags;

    inline function set_cpuAccessFlags(_v : Int) : Int return backing.cpuAccessFlags = _v;

    /**
     * Miscellaneous flags (see `D3D11_RESOURCE_MISC_FLAG`) or 0 if unused.
     * Flags can be combined with a logical OR.
     */
    public var miscFlags (get, set) : Int;

    inline function get_miscFlags() : Int return backing.miscFlags;

    inline function set_miscFlags(_v : Int) : Int return backing.miscFlags = _v;

    /**
     * The size of each element in the buffer structure (in bytes) when the buffer represents a structured buffer.
     * For more info about structured buffers, see Structured Buffer.
     * 
     * The size value in StructureByteStride must match the size of the format that you use for views of the buffer.
     * For example, if you use a shader resource view (SRV) to read a buffer in a pixel shader, the SRV format size must match the size value in StructureByteStride.
     */
    public var structureByteStride (get, set) : Int;

    inline function get_structureByteStride() : Int return backing.structureByteStride;

    inline function set_structureByteStride(_v : Int) : Int return backing.structureByteStride = _v;

    public function new(_existing : Pointer<NativeD3D11BufferDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11BufferDescription.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_BUFFER_DESC')
extern class NativeD3D11BufferDescription
{
    @:native('D3D11_BUFFER_DESC')
    static function createRef() : NativeD3D11BufferDescription;

    @:native('new D3D11_BUFFER_DESC')
    static function createPtr() : Star<NativeD3D11BufferDescription>;

    @:native('ByteWidth')
    var byteWidth : cpp.UInt32;

    @:native('Usage')
    var usage : NativeD3D11Usage;

    @:native('BindFlags')
    var bindFlags : cpp.UInt32;

    @:native('CPUAccessFlags')
    var cpuAccessFlags : cpp.UInt32;

    @:native('MiscFlags')
    var miscFlags : cpp.UInt32;

    @:native('StructureByteStride')
    var structureByteStride : cpp.UInt32;
}
