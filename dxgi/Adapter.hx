package dxgi;

import com.IUnknown;
import cpp.Star;

typedef Adapter = Star<AdapterRef>;

@:unreflective
@:structAccess
@:include("dxgi.h")
@:native("IDXGIAdapter")
extern class AdapterRef extends IUnknownRef
{
    @:native('EnumOutputs')
    function enumOutputs(_outputIndex : Int, _output : Star<Output>) : Int;
}
