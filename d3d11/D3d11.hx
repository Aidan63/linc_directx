package d3d11;

import cpp.Pointer;
import cpp.Star;
import com.HMODULE;
import dxgi.interfaces.DxgiAdapter;
import d3d11.interfaces.D3d11Device;
import d3d11.interfaces.D3d11DeviceContext;
import d3d11.enumerations.D3d11CreateDeviceFlags;
import d3d11.constants.D3d11Error;
import d3dcommon.enumerations.D3dFeatureLevel;
import d3dcommon.enumerations.D3dDriverType;

using cpp.Native;

class D3d11
{
    public static final SdkVersion = 7;

    /**
     * Creates a device that represents the display adapter.
     * @param _adapter A pointer to the video adapter to use when creating a device.
     * Pass NULL to use the default adapter, which is the first adapter that is enumerated by `IDXGIFactory1::EnumAdapters`.
     * @param _driverType The `D3D_DRIVER_TYPE`, which represents the driver type to create.
     * @param _software A handle to a DLL that implements a software rasterizer.
     * If DriverType is `D3D_DRIVER_TYPE_SOFTWARE`, Software must not be NULL. Get the handle by calling LoadLibrary, LoadLibraryEx , or GetModuleHandle.
     * @param _flags The runtime layers to enable (see `D3D11_CREATE_DEVICE_FLAG`); values can be bitwise OR'd together.
     * @param _featureLevels A pointer to an array of `D3D_FEATURE_LEVEL`s, which determine the order of feature levels to attempt to create.
     * If pFeatureLevels is set to NULL, this function uses the following array of feature levels:
     * ```haxe
     * Level11_0,
     * Level10_1,
     * Level10_0,
     * Level9_3,
     * Level9_2,
     * Level9_1
     * ```
     * @param _sdkVersion The SDK version; use `D3d11.SdkVersion`.
     * @param _device Returns the address of a pointer to an `ID3D11Device` object that represents the device created.
     * If this parameter is NULL, no `ID3D11Device` will be returned.
     * @param _featureLevel If successful, returns the first `D3D_FEATURE_LEVEL` from the pFeatureLevels array which succeeded.
     * Supply NULL as an input if you don't need to determine which feature level is supported.
     * @param _context Returns the address of a pointer to an `ID3D11DeviceContext` object that represents the device context.
     * If this parameter is NULL, no `ID3D11DeviceContext` will be returned.
     * @return Int
     */
    public static function createDevice(
        _adapter : Null<DxgiAdapter>,
        _driverType : D3dDriverType,
        _software : Null<HMODULE>,
        _flags : Int,
        _featureLevels : Null<Array<D3dFeatureLevel>>,
        _sdkVersion : Int,
        _device : Null<D3d11Device>,
        _featureLevel : Null<Array<D3dFeatureLevel>>,
        _context : Null<D3d11DeviceContext>
    ) : D3d11Error
    {
        var adapterPtr : Star<NativeIDXGIAdapter> = _adapter != null ? cast _adapter.ptr : null;
        var devicePtr  : Star<Star<NativeID3D11Device>> = _device != null ? cast _device.ptr.addressOf() : null;
        var contextPtr : Star<Star<NativeID3D11DeviceContext>> = _context != null ? cast _context.ptr.addressOf() : null;
        var levelsPtr  : Star<D3dFeatureLevel> = null;
        var gotLevel   : NativeD3DFeatureLevel = cast 0;
        var levelsIdx = 0;

        if (_featureLevels != null)
        {
            levelsPtr = cast Pointer.arrayElem(_featureLevels, 0).raw;
            levelsIdx = _featureLevels.length;
        }

        var result = NativeD3D11.createDevice(adapterPtr, cast _driverType, _software, _flags, cast levelsPtr, levelsIdx, _sdkVersion, devicePtr, gotLevel.addressOf(), contextPtr);

        if (_featureLevel != null && _featureLevel.length > 0)
        {
            _featureLevel[0] = cast gotLevel;
        }

        return result;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
extern class NativeD3D11
{
    @:native('D3D11CreateDevice')
    static function createDevice(
        _adapter : Star<NativeIDXGIAdapter>,
        _driverType : NativeD3DDriverType,
        _software : HMODULE,
        _flags : cpp.UInt32,
        _featureLevels : Star<NativeD3DFeatureLevel>,
        _featureLevelsCount : cpp.UInt32,
        _sdkVersion : cpp.UInt32,
        _device : Star<Star<NativeID3D11Device>>,
        _featureLevel : Star<NativeD3DFeatureLevel>,
        _immediateContext : Star<Star<NativeID3D11DeviceContext>>
    ) : Int;
}
