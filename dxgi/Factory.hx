package dxgi;

import com.IUnknown;

@:unreflective
@:native("::cpp::Pointer<IDXGIFactory>")
@:include("dxgi.h")
extern class Factory extends IUnknown
{
    inline function enumAdapters(_adapterIndex : Int, _adapter : Adapter) : Int
    {
        return untyped __cpp__('{0}->ptr->EnumAdapters({1}, (IDXGIAdapter**)&{2})', this, _adapterIndex, _adapter);
    }
}
