package d3d11.interfaces;

import com.GUID;
import com.Unknown;

/**
 * A resource interface provides common actions on all resources.
 */
class D3d11Resource extends Unknown
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11Resource')
extern class NativeID3D11Resource extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11Resource)');
    }
}
