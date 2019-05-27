package dxgi.constants;

/**
 * Error codes that can be returned by a DXGI function.
 */
enum abstract DxgiError(Int) from Int to Int
{
    /**
     * You tried to use a resource to which you did not have the required access privileges.
     * This error is most typically caused when you write to a shared resource with read-only access.
     */
    var AccessDenied = 0x887A002B;

    /**
     * The desktop duplication interface is invalid.
     * The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.
     */
    var AccessLost = 0x887A0026;

    /**
     * The desired element already exists.
     * This is returned by `DXGIDeclareAdapterRemovalSupport` if it is not the first time that the function is called.
     */
    var AlreadyExists = 0x887A0036;

    /**
     * DXGI can't provide content protection on the swap chain.
     * This error is typically caused by an older driver, or when you use a swap chain that is incompatible with content protection.
     */
    var CannotProtectContent = 0x887A002A;

    /**
     * The application's device failed due to badly formed commands sent by the application.
     * This is an design-time issue that should be investigated and fixed.
     */
    var DeviceHung = 0x887A0006;

    /**
     * The video card has been physically removed from the system, or a driver upgrade for the video card has occurred.
     * The application should destroy and recreate the device.
     * For help debugging the problem, call `ID3D10Device::GetDeviceRemovedReason`.
     */
    var DeviceRemoved = 0x887A0005;

    /**
     * The device failed due to a badly formed command. This is a run-time issue; The application should destroy and recreate the device.
     */
    var DeviceReset = 0x887A0007;

    /**
     * The driver encountered a problem and was put into the device removed state.
     */
    var DriverInternalError = 0x887A0020;

    /**
     * An event (for example, a power cycle) interrupted the gathering of presentation statistics.
     */
    var FrameStatisticsDisjoin = 0x887A000B;

    /**
     * The application attempted to acquire exclusive ownership of an output, but failed because some other application (or device within the application) already acquired ownership.
     */
    var GraphicsVidpinSourceInUse = 0x887A000B;
    
    /**
     * The application provided invalid parameter data; this must be debugged and fixed before the application is released.
     */
    var InvalidCall = 0x887A0001;

    /**
     * The buffer supplied by the application is not big enough to hold the requested data.
     */
    var MoreData = 0x887A0003;

    /**
     * The supplied name of a resource in a call to `IDXGIResource1::CreateSharedHandle` is already associated with some other resource.
     */
    var NameAlreadyExists = 0x887A002C;

    /**
     * A global counter resource is in use, and the Direct3D device can't currently use the counter resource.
     */
    var NonExclusive = 0x887A0021;

    /**
     * The resource or request is not currently available, but it might become available later.
     */
    var NotCurrentlyAvailable = 0x887A0022;

    /**
     * When calling `IDXGIObject::GetPrivateData`, the GUID passed in is not recognized as one previously passed to `IDXGIObject::SetPrivateData` or `IDXGIObject::SetPrivateDataInterface`.
     * When calling `IDXGIFactory::EnumAdapters` or `IDXGIAdapter::EnumOutputs`, the enumerated ordinal is out of range.
     */
    var NotFound = 0x887A0023;

    /**
     * Reserved
     */
    var RemoteClientDisconnected = 0x887A0023;

    /**
     * Reserved
     */
    var RemoteOutOfMemory = 0x887A0024;

    /**
     * The DXGI output (monitor) to which the swap chain content was restricted is now disconnected or changed.
     */
    var RestrictToOutputStale = 0x887A0029;

    /**
     * The operation depends on an SDK component that is missing or mismatched.
     */
    var SDKComponentMissing = 0x887A002D;

    /**
     * The Remote Desktop Services session is currently disconnected.
     */
    var SessionDisconnected = 0x887A0028;

    /**
     * The requested functionality is not supported by the device or the driver.
     */
    var Unsupported = 0x887A0004;

    /**
     * The time-out interval elapsed before the next desktop frame was available.
     */
    var WaitTimeout = 0x887A0027;

    /**
     * The GPU was busy at the moment when a call was made to perform an operation, and did not execute or schedule the operation.
     */
    var WasStillDrawing = 0x887A000A;

    /**
     * The method succeeded without an error.
     */
    var Ok = 0x0;
}