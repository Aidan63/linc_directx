package dxgi.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import dxgi.constants.DxgiError;

using cpp.Native;

class DxgiObject extends Unknown
{
    public function getParent(_guid : cpp.Struct<GUID>, _parent : Unknown) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGIObject>).getParent(_guid, cast _parent.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGIObject")
@:include("dxgi.h")
extern class NativeIDXGIObject extends NativeIUnknown
{
    @:native('GetParent')
    function getParent(_guid : GUID, _parent : Star<Star<cpp.Void>>) : Int;
}
