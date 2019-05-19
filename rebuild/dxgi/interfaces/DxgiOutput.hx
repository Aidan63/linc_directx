package dxgi.interfaces;

import com.GUID;
import dxgi.interfaces.DxgiObject;

/**
 * An `IDXGIOutput` interface represents an adapter output (such as a monitor).
 * 
 * To see the outputs available, use `IDXGIAdapter::EnumOutputs`.
 * To see the specific output that the swap chain will update, use `IDXGISwapChain::GetContainingOutput`.
 */
class DxgiOutput extends DxgiObject
{
    //
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGIOutput")
@:include("dxgi.h")
extern class NativeIDXGIOutput extends NativeIDXGIObject
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIOutput)');
    }
}
