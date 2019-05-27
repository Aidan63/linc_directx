package d3d11.interfaces;

import com.GUID;
import d3d11.interfaces.D3d11Resourse;

class D3d11Buffer extends D3d11Resource
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11Buffer')
extern class NativeID3D11Buffer extends NativeID3D11Resource
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11Buffer)');
    }
}
