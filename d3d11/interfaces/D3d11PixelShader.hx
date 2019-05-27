package d3d11.interfaces;

import com.GUID;
import com.Unknown;

/**
 * A pixel-shader interface manages an executable program (a pixel shader) that controls the pixel-shader stage.
 */
class D3d11PixelShader extends Unknown
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11PixelShader')
extern class NativeID3D11PixelShader extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11PixelShader)');
    }
}
