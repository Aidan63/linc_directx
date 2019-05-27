package d3d11.interfaces;

import com.GUID;
import com.Unknown;

class D3d11ClassInstance extends Unknown
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11ClassInstance')
extern class NativeID3D11ClassInstance extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11ClassInstance)');
    }
}
