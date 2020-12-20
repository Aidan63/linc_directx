package dxgi.interfaces;

import com.HWND;
import cpp.Star;
import com.HMODULE;
import com.GUID;
import com.Unknown;
import dxgi.interfaces.DxgiOutput;
import dxgi.interfaces.DxgiAdapter;
import dxgi.interfaces.DxgiSwapChain;
import dxgi.structures.DxgiSwapChainDescription;
import dxgi.structures.DxgiSwapChainFullscreenDescription;
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
    public function createSoftwareAdapter(_module : cpp.Struct<HMODULE>, _adapter : DxgiAdapter) : DxgiError
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
}

@:keep
@:unreflective
@:structAccess
@:include("dxgi.h")
@:native("IDXGIFactory")
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
}

/**
 * The IDXGIFactory1 interface implements methods for generating DXGI objects.
 */
class DxgiFactory1 extends DxgiFactory
{
    public static final uuid : cpp.Struct<GUID> = NativeIDXGIFactory1.uuid();

    public function isCurrent()
    {
        return (cast ptr : Star<NativeIDXGIFactory1>).isCurrent();
    }

    public function enumAdapters1(_adapterIdx : Int, _adapter : DxgiAdapter1) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory1>).enumAdapters1(_adapterIdx, cast _adapter.ptr.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
@:include("dxgi.h")
@:native("IDXGIFactory1")
extern class NativeIDXGIFactory1 extends NativeIDXGIFactory
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIFactory1)');
    }

    @:native('IsCurrent')
    function isCurrent() : Bool;

    @:native('EnumAdapters1')
    public function enumAdapters1(_adapter : Int, _ppAdapter : cpp.Star<cpp.Star<NativeIDXGIAdapter1>>) : Int;
}

/**
 * The `DxgiFactory2` interface includes methods to create a newer version swap chain with more features than `DxgiSwapChain` and to monitor stereoscopic 3D capabilities.
 */
class DxgiFactory2 extends DxgiFactory1
{
    public static final uuid : cpp.Struct<GUID> = NativeIDXGIFactory2.uuid();

    /**
     * Creates a swap chain that is associated with an HWND handle to the output window for the swap chain.
     * @param _device For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain.
     * For Direct3D 12 this is a pointer to a direct command queue (refer to `D3d12CommandQueue`).
     * @param _hwnd The HWND handle that is associated with the swap chain that `createSwapChainForHwnd` creates.
     * @param _description A pointer to a `DxgiSwapChainDescription1` structure for the swap-chain description.
     * @param _fullscreen A pointer to a `DxgiSwapChainFullscreenDescription` structure for the description of a full-screen swap chain.
     * You can optionally set this parameter to create a full-screen swap chain.
     * Set it to `NULL` to create a windowed swap chain.
     * @param _restrictToOutput A pointer to the `DxgiOutput` interface for the output to restrict content to.
     * You must also pass the `DxgiPresent.RestrictToOutput` flag in a `DxgiSwapChain1.Present1` call to force the content to appear blacked out on any other output.
     * If you want to restrict the content to a different output, you must create a new swap chain.
     * However, you can conditionally restrict content based on the `DxgiPresent.RestrictToOutput` flag.
     * 
     * Set this parameter to NULL if you don't want to restrict content to an output target.
     * @param _swapChain A pointer to a variable that receives a pointer to the `DxgiSwapChain1` interface for the swap chain that `createSwapChainForHwnd` creates.
     * @return DxgiError
     */
    public function createSwapChainForHwnd(_device : Unknown, _hwnd : cpp.Struct<HWND>, _description : DxgiSwapChainDescription1, _fullscreen : Null<DxgiSwapChainFullscreenDescription>, _restrictToOutput : Null<DxgiOutput>, _swapChain : DxgiSwapChain1) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIFactory2>).createSwapChainForHwnd(_device.ptr, _hwnd, _description.backing, _fullscreen == null ? null : _fullscreen.backing, _restrictToOutput == null ? null : cast _restrictToOutput.ptr, cast _swapChain.ptr.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi1_2.h')
@:native('IDXGIFactory2')
extern class NativeIDXGIFactory2 extends NativeIDXGIFactory1
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIFactory2)');
    }

    @:native('CreateSwapChainForHwnd')
    function createSwapChainForHwnd(
        _device : Star<NativeIUnknown>,
        _hwnd : HWND,
        _description : Star<NativeDXGISwapChainDescription1>,
        _fullscreenDescription : Star<NativeDXGISwapChainFullscreenDescription>,
        _output : Star<NativeIDXGIOutput>,
        _swapchain : Star<Star<NativeIDXGISwapChain1>>) : Int;
}
