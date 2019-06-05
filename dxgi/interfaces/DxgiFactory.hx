package dxgi.interfaces;

import com.HWND;
import cpp.Star;
import com.HMODULE;
import com.GUID;
import com.Unknown;
import dxgi.interfaces.DxgiAdapter;
import dxgi.interfaces.DxgiSwapChain;
import dxgi.structures.DxgiSwapChainDescription;
import dxgi.constants.DxgiError;

using cpp.Native;

/**
 * An IDXGIFactory interface implements methods for generating DXGI objects (which handle full screen transitions).
 */
class DxgiFactory extends DxgiObject
{
    /**
     * Create an adapter interface that represents a software adapter.
     * @param _module Handle to the software adapter's dll. `HMODULE` can be obtained with `GetModuleHandle` or `LoadLibrary`.
     * @param _adapter Address of a pointer to an adapter (see `IDXGIAdapter`).
     * @return DxgiError
     */
    public function createSoftwareAdapter(_module : HMODULE, _adapter : DxgiAdapter) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).createSoftwareAdapter(_module, cast _adapter.ptr.addressOf());
    }

    /**
     * Starting with Direct3D 11.1, we recommend not to use `CreateSwapChain` anymore to create a swap chain. Instead, use `CreateSwapChainForHwnd`, `CreateSwapChainForCoreWindow`, or `CreateSwapChainForComposition` depending on how you want to create the swap chain.
     * 
     * Creates a swap chain.
     * @param _device For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to `ID3D12CommandQueue`). This parameter cannot be NULL.
     * @param _description A pointer to a `DXGI_SWAP_CHAIN_DESC` structure for the swap-chain description. This parameter cannot be NULL.
     * @param _swapchain A pointer to a variable that receives a pointer to the `IDXGISwapChain` interface for the swap chain that `CreateSwapChain` creates.
     * @return `DXGI_ERROR_INVALID_CALL` if pDesc or ppSwapChain is NULL, `DXGI_STATUS_OCCLUDED` if you request full-screen mode and it is unavailable, or `E_OUTOFMEMORY`. Other error codes defined by the type of device passed in may also be returned.
     */
    public function createSwapChain(_device : Unknown, _description : DxgiSwapChainDescription, _swapchain : DxgiSwapChain) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).createSwapChain(_device.ptr, _description.backing, cast _swapchain.ptr.addressOf());
    }

    /**
     * Enumerates the adapters (video cards).
     * @param _index The index of the adapter to enumerate.
     * @param _adapter The address of a pointer to an `IDXGIAdapter` interface at the position specified by the Adapter parameter. This parameter must not be NULL.
     * @return Returns `S_OK` if successful; otherwise, returns `DXGI_ERROR_NOT_FOUND` if the index is greater than or equal to the number of adapters in the local system, or `DXGI_ERROR_INVALID_CALL` if ppAdapter parameter is NULL.
     */
    public function enumAdapters(_index : Int, _adapter : DxgiAdapter) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).enumAdapters(_index, cast _adapter.ptr.addressOf());
    }

    /**
     * Get the window through which the user controls the transition to and from full screen.
     * @param _windowHandle A pointer to a window handle.
     * @return Returns a code that indicates success or failure. `S_OK` indicates success, `DXGI_ERROR_INVALID_CALL` indicates pWindowHandle was passed in as NULL.
     */
    public function getWindowAssociation(_windowHandle : HWND) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).getWindowAssociation(_windowHandle.addressOf());
    }

    /**
     * Allows DXGI to monitor an application's message queue for the alt-enter key sequence (which causes the application to switch from windowed to full screen or vice versa).
     * @param _windowHandle The handle of the window that is to be monitored. This parameter can be NULL; but only if the flags are also 0.
     * @param _flags One or more of the following values:
     * - `DXGI_MWA_NO_WINDOW_CHANGES` - Prevent DXGI from monitoring an applications message queue; this makes DXGI unable to respond to mode changes.
     * - `DXGI_MWA_NO_ALT_ENTER` - Prevent DXGI from responding to an alt-enter sequence.
     * - `DXGI_MWA_NO_PRINT_SCREEN` - Prevent DXGI from responding to a print-screen key.
     * @return `DXGI_ERROR_INVALID_CALL` if WindowHandle is invalid, or `E_OUTOFMEMORY`.
     */
    public function makeWindowAssociation(_windowHandle : HWND, _flags : Int) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory>).makeWindowAssociation(_windowHandle, _flags);
    }
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

    @:native('CreateSoftwareAdapter')
    function createSoftwareAdapter(_module : HMODULE, _adapter : Star<Star<NativeIDXGIAdapter>>) : Int;

    @:native('EnumAdapters')
    function enumAdapters(_index : cpp.UInt32, _ptr : Star<Star<NativeIDXGIAdapter>>) : Int;

    @:native('CreateSwapChain')
    function createSwapChain(_device : Star<NativeIUnknown>, _description : Star<NativeDXGISwapChainDescription>, _swapchain : Star<Star<NativeIDXGISwapChain>>) : Int;

    @:native('GetWindowAssociation')
    function getWindowAssociation(_windowHandle : Star<HWND>) : Int;

    @:native('MakeWindowAssociation')
    function makeWindowAssociation(_windowHandle : HWND, _flags : cpp.UInt32) : Int;
}

#if (dxgi_feature_level >= 1.1)

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
@:native("IDXGIFactory1")
@:include("dxgi.h")
extern class NativeIDXGIFactory1 extends NativeIDXGIFactory
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIFactory1)');
    }
}

#end
