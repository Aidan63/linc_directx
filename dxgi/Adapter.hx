package dxgi;

import com.IUnknown;
import cpp.Star;

typedef Adapter = Star<AdapterRef>;

@:unreflective
@:structAccess
@:native("IDXGIAdapter")
@:include("dxgi.h")
private extern class AdapterRef extends IUnknown
{
    /*
    inline function enumOutputs(_outputIndex : Int, _output : Star<Output>) : Int
    {
        return untyped __cpp__('{0}->EnumOutputs({1}, (IDXGIOutput**){2})', this, _outputIndex, _output);
    }
    */

    @:native('EnumOutputs')
    function enumOutputs(_outputIndex : Int, _output : Star<Output>) : Int;
}
