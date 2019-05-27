package dxgi.interfaces;

import dxgi.structures.DxgiSwapChainDescription;
import cpp.Star;
import com.GUID;
import com.Unknown;
import dxgi.interfaces.DxgiAdapter;
import dxgi.interfaces.DxgiSwapChain;
import dxgi.constants.DxgiError;

using cpp.Native;

/**
 * An IDXGIFactory interface implements methods for generating DXGI objects (which handle full screen transitions).
 */
class DxgiFactory extends DxgiObject
{
    public function createSoftwareAdapter()
    {
        //
    }

    public function createSwapChain(_device : Unknown, _description : DxgiSwapChainDescription, _swapchain : DxgiSwapChain) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).createSwapChain(_device.ptr, _description.backing, cast _swapchain.ptr.addressOf());
    }

    public function enumAdapters(_index : Int, _adapter : DxgiAdapter) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).enumAdapters(_index, cast _adapter.ptr.addressOf());
    }

    public function getWindowAssociation()
    {
        //
    }

    public function makeWindowAssociation()
    {
        //
    }
}

/**
 * The IDXGIFactory1 interface implements methods for generating DXGI objects.
 */
class DxgiFactory1 extends DxgiFactory
{
    //
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGIFactory")
@:include("dxgi.h")
extern class NativeIDXGIFactory extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIFactory)');
    }

    @:native('EnumAdapters')
    function enumAdapters(_index : cpp.UInt32, _ptr : Star<Star<NativeIDXGIAdapter>>) : Int;

    @:native('CreateSwapChain')
    function createSwapChain(_device : Star<NativeIUnknown>, _description : Star<NativeDXGISwapChainDescription>, _swapchain : Star<Star<NativeIDXGISwapChain>>) : Int;
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGIFactory1")
@:include("dxgi.h")
extern class NativeIDXGIFactory1 extends NativeIDXGIFactory
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIFactory1)');
    }
}
