package dxgi.interfaces;

import cpp.Star;
import com.GUID;
import dxgi.interfaces.DxgiObject;
import dxgi.interfaces.DxgiOutput;
import dxgi.constants.DxgiError;
import dxgi.structures.DxgiAdapterDescription;

using cpp.Native;

/**
 * The `IDXGIAdapter` interface represents a display subsystem (including one or more GPUs, DACs and video memory).
 * 
 * A display subsystem is often referred to as a video card, however, on some machines the display subsystem is part of the motherboard.
 * To enumerate the display subsystems, use `IDXGIFactory::EnumAdapters`.
 * To get an interface to the adapter for a particular device, use `IDXGIDevice::GetAdapter`.
 * To create a software adapter, use `IDXGIFactory::CreateSoftwareAdapter`.
 */
class DxgiAdapter extends DxgiObject
{
    /**
     * Gets a DXGI 1.0 description of an adapter (or video card).
     * 
     * Graphics apps can use the DXGI API to retrieve an accurate set of graphics memory values on systems that have Windows Display Driver Model (WDDM) drivers.
     * 
     * @param _description A pointer to a `DXGI_ADAPTER_DESC` structure that describes the adapter. This parameter must not be `NULL`.
     * On feature level 9 graphics hardware, GetDesc returns zeros for the PCI ID in the VendorId, DeviceId, SubSysId, and Revision members of `DXGI_ADAPTER_DESC` and “Software Adapter” for the description string in the Description member.
     * @return Returns `S_OK` if successful; otherwise returns `E_INVALIDARG` if the pDesc parameter is `NULL`.
     */
    public function getDesc(_description : DxgiAdapterDescription) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIAdapter>).getDesc(_description.backing);
    }

    /**
     * Enumerate adapter (video card) outputs.
     * 
     * EnumOutputs first returns the output on which the desktop primary is displayed. This output corresponds with an index of zero.
     * EnumOutputs then returns other outputs.
     * 
     * @param _output The index of the output.
     * @param _object The address of a pointer to an IDXGIOutput interface at the position specified by the Output parameter.
     * @return A code that indicates success or failure (see `DXGI_ERROR`). `DXGI_ERROR_NOT_FOUND` is returned if the index is greater than the number of outputs.
     * If the adapter came from a device created using `D3D_DRIVER_TYPE_WARP`, then the adapter has no outputs, so `DXGI_ERROR_NOT_FOUND` is returned.
     */
    public function enumOutputs(_output : Int, _object : DxgiOutput) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIAdapter>).enumOutputs(_output, cast _object.ptr.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGIAdapter")
@:include("dxgi.h")
extern class NativeIDXGIAdapter extends NativeIDXGIObject
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIAdapter)');
    }

    @:native('GetDesc')
    function getDesc(_desc : Star<NativeDXGIAdapterDescription>) : Int;

    @:native('EnumOutputs')
    function enumOutputs(_output : cpp.UInt32, _ptr : Star<Star<NativeIDXGIOutput>>) : Int;
}
