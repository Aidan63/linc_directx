package dxgi.interfaces;

import com.GUID;
import dxgi.interfaces.DxgiObject;

/**
 * An IDXGISwapChain interface implements one or more surfaces for storing rendered data before presenting it to an output.
 */
class DxgiSwapChain extends DxgiObject
{
    //
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGISwapChain")
@:include("dxgi.h")
extern class NativeIDXGISwapChain extends NativeIDXGIObject
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGISwapChain)');
    }
}
