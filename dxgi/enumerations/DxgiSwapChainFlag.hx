package dxgi.enumerations;

enum abstract DxgiSwapChainFlag(Int) from Int to Int
{
    /**
     * Set this flag to turn off automatic image rotation; that is, do not perform a rotation when transferring the contents of the front buffer to the monitor.
     * Use this flag to avoid a bandwidth penalty when an application expects to handle rotation. This option is valid only during full-screen mode.
     */
    var NonPreRotated = 1;

    /**
     * Set this flag to enable an application to switch modes by calling `IDXGISwapChain::ResizeTarget`.
     * When switching from windowed to full-screen mode, the display mode (or monitor resolution) will be changed to match the dimensions of the application window.
     */
    var AllowModeSwitch = 2;

    /**
     * Set this flag to enable an application to render using GDI on a swap chain or a surface.
     * This will allow the application to call `IDXGISurface1::GetDC` on the 0th back buffer or a surface.
     */
    var GdiCompatible = 4;

    /**
     * Set this flag to indicate that the swap chain might contain protected content; therefore, the operating system supports the creation of the swap chain only when driver and hardware protection is used.
     * If the driver and hardware do not support content protection, the call to create a resource for the swap chain fails.
     * 
     * Direct3D 11:  This enumeration value is supported starting with Windows 8.
     */
    var RestrictedContent = 8;

    /**
     * Set this flag to indicate that shared resources that are created within the swap chain must be protected by using the driver’s mechanism for restricting access to shared surfaces.
     * 
     * Direct3D 11:  This enumeration value is supported starting with Windows 8.
     */
    var RestrictSharedResourcesDriver = 16;

    /**
     * Set this flag to restrict presented content to the local displays.
     * Therefore, the presented content is not accessible via remote accessing or through the desktop duplication APIs.
     * 
     * This flag supports the window content protection features of Windows.
     * Applications can use this flag to protect their own onscreen window content from being captured or copied through a specific set of public operating system features and APIs.
     * 
     * If you use this flag with windowed (HWND or IWindow) swap chains where another process created the HWND, the owner of the HWND must use the `SetWindowDisplayAffinity` function appropriately in order to allow calls to `IDXGISwapChain::Present` or `IDXGISwapChain1::Present1` to succeed.
     * 
     * Direct3D 11:  This enumeration value is supported starting with Windows 8.
     */
    var DisplayOnly = 32;

    /**
     * Set this flag to create a waitable object you can use to ensure rendering does not begin while a frame is still being presented.
     * When this flag is used, the swapchain's latency must be set with the `IDXGISwapChain2::SetMaximumFrameLatency` API instead of `IDXGIDevice1::SetMaximumFrameLatency`.
     * 
     * Note  This enumeration value is supported starting with Windows 8.1.
     */
    var FrameLatencyWaitableObject = 64;

    /**
     * Set this flag to create a swap chain in the foreground layer for multi-plane rendering.
     * This flag can only be used with CoreWindow swap chains, which are created with `CreateSwapChainForCoreWindow`.
     * Apps should not create foreground swap chains if `IDXGIOutput2::SupportsOverlays` indicates that hardware support for overlays is not available.
     * 
     * Note that `IDXGISwapChain::ResizeBuffers` cannot be used to add or remove this flag.
     * 
     * Note : This enumeration value is supported starting with Windows 8.1.
     */
    var ForegroundLayer = 128;

    /**
     * Set this flag to create a swap chain for full-screen video.
     * 
     * Note : This enumeration value is supported starting with Windows 8.1.
     */
    var FullscreenVideo = 256;

    /**
     * Set this flag to create a swap chain for YUV video.
     * 
     * Note : This enumeration value is supported starting with Windows 8.1.
     */
    var YuvVideo = 512;

    /**
     * Indicates that the swap chain should be created such that all underlying resources can be protected by the hardware.
     * Resource creation will fail if hardware content protection is not supported.
     * 
     * This flag has the following restrictions:
     * - This flag can only be used with swap effect `DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL`.
     * 
     * Note : Creating a swap chain using this flag does not automatically guarantee that hardware protection will be enabled for the underlying allocation.
     * Some implementations require that the DRM components are first initialized prior to any guarantees of protection.
     * 
     * Note : This enumeration value is supported starting with Windows 10.
     */
    var HWProtected = 1024;

    /**
     * Tearing support is a requirement to enable displays that support variable refresh rates to function properly when the application presents a swap chain tied to a full screen borderless window.
     * Win32 apps can already achieve tearing in fullscreen exclusive mode by calling SetFullscreenState(TRUE), but the recommended approach for Win32 developers is to use this tearing flag instead.
     * This flag requires the use of a `DXGI_SWAP_EFFECT_FLIP_*` swap effect.
     * 
     * To check for hardware support of this feature, refer to `IDXGIFactory5::CheckFeatureSupport`. For usage information refer to `IDXGISwapChain::Present` and the `DXGI_PRESENT` flags.
     */
    var AllowTearing = 2048;

    var RestrictedToAllHolographicDisplays = 4096;
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_SWAP_CHAIN_FLAG')
extern class NativeDXGISwapChainFlag
{
    //
}
