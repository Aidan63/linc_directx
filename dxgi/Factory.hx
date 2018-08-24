package dxgi;

import cpp.Star;
import com.IUnknown;
import dxgi.Adapter;

typedef Factory = Star<FactoryRef>;

@:unreflective
@:structAccess
@:native("IDXGIFactory")
@:include("dxgi.h")
private extern class FactoryRef extends IUnknownRef
{
    @:native('EnumAdapters')
    function enumAdapters(_adapterIndex : Int, _adapter : Star<Adapter>) : Int;

    @:native('CreateSwapChain')
    function createSwapChain(_device : IUnknown, _description : Star<SwapChainDescription>, _swapchain : Star<SwapChain>) : Int;
}
