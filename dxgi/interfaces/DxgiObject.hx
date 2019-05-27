package dxgi.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import dxgi.constants.DxgiError;

using cpp.Native;

class DxgiObject extends Unknown
{
    public static final uuid = NativeIDXGIObject.uuid();

    public function getParent(_guid : GUID, _parent : Unknown) : DxgiError
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
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGIObject)');
    }

    @:native('GetParent')
    function getParent(_guid : GUID, _parent : Star<Star<cpp.Void>>) : Int;
}
