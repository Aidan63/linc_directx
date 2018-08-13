package dxgi;

import dxgi.DXGI.DXGI_FORMAT;
import d3d.d3d11.Texture2D;
import com.IUnknown;

@:unreflective
@:native("::cpp::Pointer<IDXGISwapChain>")
@:include("dxgi.h")
extern class SwapChain extends IUnknown
{
    inline function getBuffer(_buffer : Int, _surface : Texture2D) : Int
    {
        return untyped __cpp__('{0}->ptr->GetBuffer({1}, __uuidof(ID3D11Texture2D), (void**)&{2})', this, _buffer, _surface);
    }

    inline function present(_syncInterval : Int, _flags : Int) : Int
    {
        return untyped __cpp__('{0}->ptr->Present({1}, {2})', this, _syncInterval, _flags);
    }

    inline function resizeBuffers(_bufferCount : Int, _width : Int, _height : Int, _format : DXGI_FORMAT, _flags : Int) : Int
    {
        return untyped __cpp__('{0}->ptr->ResizeBuffers({1}, {2}, {3}, {4}, {5})', this, _bufferCount, _width, _height, _format, _flags);
    }
}
