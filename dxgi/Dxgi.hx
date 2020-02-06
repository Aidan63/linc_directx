package dxgi;

import cpp.Star;
import com.GUID;
import dxgi.interfaces.DxgiFactory;
import dxgi.constants.DxgiError;

using cpp.Native;

@:headerCode('#include <dxgi.h>
#include <dxgi1_3.h>')
class Dxgi
{
    /**
     * Creates a DXGI 1.0 factory that you can use to generate other DXGI objects.
     * @param _factory Address of a pointer to an IDXGIFactory object.
     * @return DXGIFactory
     */
    static public function createFactory(_factory : DxgiFactory) : DxgiError
    {
        return NativeDXGI.createFactory(NativeIDXGIFactory.uuid(), cast _factory.ptr.addressOf());
    }

    /**
     * Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
     * @param _factory Address of a pointer to an IDXGIFactory1 object.
     * @return DXGIFactory1
     */
    static public function createFactory1(_factory : DxgiFactory1) : DxgiError
    {
        return NativeDXGI.createFactory1(NativeIDXGIFactory1.uuid(), cast _factory.ptr.addressOf());
    }

    /**
     * Creates a DXGI 1.3 factory that you can use to generate other DXGI objects.
     * 
     * In Windows 8, any DXGI factory created while DXGIDebug.dll was present on the system would load and use it.
     * Starting in Windows 8.1, apps explicitly request that DXGIDebug.dll be loaded instead.
     * Use CreateDXGIFactory2 and specify the DXGI_CREATE_FACTORY_DEBUG flag to request DXGIDebug.dll;
     * the DLL will be loaded if it is present on the system.
     * @param _flags Valid values include the DXGI_CREATE_FACTORY_DEBUG (0x01) flag, and zero.
     * @param _factory Address of a pointer to an IDXGIFactory2 object.
     * @return Returns S_OK if successful; an error code otherwise.
     */
    static public function createFactory2(_flags : Int, _factory : DxgiFactory2) : DxgiError
    {
        return NativeDXGI.createFactory2(_flags, DxgiFactory2.uuid, cast _factory.ptr.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
extern class NativeDXGI
{
    @:native('CreateDXGIFactory')
    static function createFactory(_guid : GUID, _ptr : Star<Star<cpp.Void>>) : Int;

    @:native('CreateDXGIFactory1')
    static function createFactory1(_guid : GUID, _ptr : Star<Star<cpp.Void>>) : Int;

    @:native('CreateDXGIFactory2')
    static function createFactory2(_flags : cpp.UInt32, _guid : GUID, _ptr : Star<Star<cpp.Void>>) : Int;
}
