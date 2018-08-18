package dxgi;

import cpp.Star;
import com.IUnknown;

typedef Factory = cpp.Star<FactoryRef>;

@:unreflective
@:structAccess
@:native("IDXGIFactory")
@:include("dxgi.h")
private extern class FactoryRef extends IUnknown
{
    /*
    inline function enumAdapters(_adapterIndex : Int, _adapter : Star<Adapter>) : Int
    {
        return untyped __cpp__('{0}->EnumAdapters({1}, {2})', this, _adapterIndex, _adapter);
    }
    */

    @:native('EnumAdapters')
    function enumAdapters(_adapterIndex : Int, _adapter : Star<Adapter>) : Int;

    inline function createSwapChain(_device : IUnknown, _description : SwapChainDescription, _swapchain : Star<SwapChain>) : Int
    {
        return untyped __cpp__('{0}->CreateSwapChain({1}, &{2}, {3})', this, _device, _description, _swapchain);
    }
}
