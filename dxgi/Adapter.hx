package dxgi;

import com.IUnknown;

@:unreflective
@:native("::cpp::Pointer<IDXGIAdapter>")
@:include("dxgi.h")
extern class Adapter extends IUnknown
{
    inline function enumOutputs(_outputIndex : Int, _output : Output) : Int
    {
        return untyped __cpp__('{0}->ptr->EnumOutputs({1}, (IDXGIOutput**)&{2})', this, _outputIndex, _output);
    }
}
