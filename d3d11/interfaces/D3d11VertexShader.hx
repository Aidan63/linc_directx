package d3d11.interfaces;

import com.GUID;
import com.Unknown;

/**
 * A vertex-shader interface manages an executable program (a vertex shader) that controls the vertex-shader stage.
 */
class D3d11VertexShader extends Unknown
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11VertexShader')
extern class NativeID3D11VertexShader extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11VertexShader)');
    }
}
