package dxgi;

import dxgi.DXGI.DXGI_FORMAT;
import d3d.d3d11.Texture2D;
import com.IUnknown;
import cpp.Star;

typedef SwapChain = Star<SwapChainRef>;

@:unreflective
@:structAccess
@:native("IDXGISwapChain")
@:include("dxgi.h")
private extern class SwapChainRef extends IUnknown
{
    inline function getBuffer(_buffer : Int, _surface : Star<Texture2D>) : Int
    {
        return untyped __cpp__('{0}->GetBuffer({1}, __uuidof(ID3D11Texture2D), (void**){2})', this, _buffer, _surface);
    }

    /*
    inline function present(_syncInterval : Int, _flags : Int) : Int
    {
        return untyped __cpp__('{0}->Present({1}, {2})', this, _syncInterval, _flags);
    }

    inline function resizeBuffers(_bufferCount : Int, _width : Int, _height : Int, _format : DXGI_FORMAT, _flags : Int) : Int
    {
        return untyped __cpp__('{0}->ResizeBuffers({1}, {2}, {3}, {4}, {5})', this, _bufferCount, _width, _height, _format, _flags);
    }
    */

    @:native('Present')
    function present(_syncInterval : Int, _flags : Int) : Int;

    @:native('ResizeBuffers')
    function resizeBuffers(_bufferCount : Int, _width : Int, _height : Int, _format : DXGI_FORMAT, _flags : Int) : Int;
}
