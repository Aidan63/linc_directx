package d3dcommon.enumerations;

/**
 * Driver type options.
 */
enum abstract D3dDriverType(Int) to Int
{
    /**
     * The driver type is unknown.
     */
    var Unknown;

    /**
     * A hardware driver, which implements Direct3D features in hardware.
     * This is the primary driver that you should use in your Direct3D applications because it provides the best performance.
     * A hardware driver uses hardware acceleration (on supported hardware) but can also use software for parts of the pipeline that are not supported in hardware.
     * This driver type is often referred to as a hardware abstraction layer or HAL.
     */
    var Hardware;

    /**
     * A reference driver, which is a software implementation that supports every Direct3D feature.
     * A reference driver is designed for accuracy rather than speed and as a result is slow but accurate.
     * The rasterizer portion of the driver does make use of special CPU instructions whenever it can, but it is not intended for retail applications;
     * use it only for feature testing, demonstration of functionality, debugging, or verifying bugs in other drivers.
     * The reference device for this driver is installed by the Windows SDK 8.0 or later and is intended only as a debug aid for development purposes.
     * This driver may be referred to as a REF driver, a reference driver, or a reference rasterizer. [[]]
     */
    var Reference;

    /**
     * A NULL driver, which is a reference driver without render capability.
     * This driver is commonly used for debugging non-rendering API calls, it is not appropriate for retail applications.
     * This driver is installed by the DirectX SDK.
     */
    var Null;

    /**
     * A software driver, which is a driver implemented completely in software.
     * The software implementation is not intended for a high-performance application due to its very slow performance.
     */
    var Software;

    /**
     * A WARP driver, which is a high-performance software rasterizer.
     * The rasterizer supports feature levels 9_1 through level 10_1 with a high performance software implementation.
     * For information about limitations creating a WARP device on certain feature levels, see Limitations Creating WARP and Reference Devices.
     * For more information about using a WARP driver, see Windows Advanced Rasterization Platform (WARP) In-Depth Guide.
     */
    var Warp;
}

@:keep
@:unreflective
@:include('d3dcommon.h')
@:native('D3D_DRIVER_TYPE')
extern class NativeD3DDriverType
{
    //
}
