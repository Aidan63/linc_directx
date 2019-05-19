package dxgi.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Star;
import cpp.Pointer;

/**
 * Describes an adapter (or video card) by using DXGI 1.0.
 * 
 * The `DXGI_ADAPTER_DESC` structure provides a description of an adapter. This structure is initialized by using the `IDXGIAdapter::GetDesc` method.
 */
class DxgiAdapterDescription
{
    public final backing : Star<NativeDXGIAdapterDescription>;

    /**
     * A string that contains the adapter description. On feature level 9 graphics hardware, GetDesc returns “Software Adapter” for the description string.
     */
    public var description (get, set) : String;

    inline function get_description() : String return untyped __cpp__('String::create({0}, {1})', backing.description, 128);

    inline function set_description(_v : String) : String
    {
        for (i in 0...128)
        {
            if (i < _v.length)
            {
                backing.description[i] = _v.charCodeAt(i);
            }
            else
            {
                backing.description[i] = 0x0;
            }
        }

        return _v;
    }

    /**
     * The PCI ID of the hardware vendor. On feature level 9 graphics hardware, GetDesc returns zeros for the PCI ID of the hardware vendor.
     */
    public var vendorID (get, set) : Int;

    inline function get_vendorID() : Int return backing.vendorID;

    inline function set_vendorID(_v : Int) : Int return backing.vendorID = _v;

    /**
     * The PCI ID of the hardware device. On feature level 9 graphics hardware, GetDesc returns zeros for the PCI ID of the hardware device.
     */
    public var deviceID (get, set) : Int;

    inline function get_deviceID() : Int return backing.deviceID;

    inline function set_deviceID(_v : Int) : Int return backing.deviceID = _v;

    /**
     * The PCI ID of the sub system. On feature level 9 graphics hardware, GetDesc returns zeros for the PCI ID of the sub system.
     */
    public var subSysID (get, set) : Int;
    
    function get_subSysID() : Int return backing.subSysID;
    
    function set_subSysID(_v : Int) : Int return backing.subSysID = _v;

    /**
     * The PCI ID of the revision number of the adapter.
     * On feature level 9 graphics hardware, GetDesc returns zeros for the PCI ID of the revision number of the adapter.
     */
    public var revision (get, set) : Int;

    function get_revision() : Int return backing.revision;

    function set_revision(_v : Int) return backing.revision = _v;

    /**
     * The number of bytes of dedicated video memory that are not shared with the CPU.
     */
    public var dedicatedVideoMemory (get, set) : Int;

    function get_dedicatedVideoMemory() : Int return backing.dedicatedVideoMemory;

    function set_dedicatedVideoMemory(_v : Int) : Int return backing.dedicatedVideoMemory = _v;

    /**
     * The number of bytes of dedicated system memory that are not shared with the CPU.
     * This memory is allocated from available system memory at boot time.
     */
    public var dedicatedSystemMemory (get, set) : Int;

    function get_dedicatedSystemMemory() : Int return backing.dedicatedSystemMemory;

    function set_dedicatedSystemMemory(_v : Int) : Int return backing.dedicatedSystemMemory;

    /**
     * The number of bytes of shared system memory.
     * This is the maximum value of system memory that may be consumed by the adapter during operation.
     * Any incidental memory consumed by the driver as it manages and uses video memory is additional.
     */
    public var sharedSystemMemory (get, set) : Int;

    function get_sharedSystemMemory() : Int return backing.sharedSystemMemory;

    function set_sharedSystemMemory(_v : Int) : Int return backing.sharedSystemMemory = _v;

    public function new(_existing : Pointer<NativeDXGIAdapterDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGIAdapterDescription.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    @:void
    static function finalize(_obj : DxgiAdapterDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_ADAPTER_DESC')
extern class NativeDXGIAdapterDescription
{
    @:native('DXGI_ADAPTER_DESC')
    static function createRef() : NativeDXGIAdapterDescription;

    @:native('new DXGI_ADAPTER_DESC')
    static function createPtr() : Star<NativeDXGIAdapterDescription>;

    @:native('Description')
    var description : cpp.RawPointer<cpp.UInt16>;

    @:native('VendorId')
    var vendorID : cpp.UInt32;

    @:native('DeviceId')
    var deviceID : cpp.UInt32;

    @:native('SubSysId')
    var subSysID : cpp.UInt32;

    @:native('Revision')
    var revision : cpp.UInt32;

    @:native('DedicatedVideoMemory')
    var dedicatedVideoMemory : cpp.SizeT;

    @:native('DedicatedSystemMemory')
    var dedicatedSystemMemory : cpp.SizeT;

    @:native('SharedSystemMemory')
    var sharedSystemMemory : cpp.SizeT;
}
