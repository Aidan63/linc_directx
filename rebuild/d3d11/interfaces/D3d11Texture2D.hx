package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import d3d11.interfaces.D3d11Resourse;
import d3d11.structures.D3d11Texture2DDescription;

/**
 * A 2D texture interface manages texel data, which is structured memory.
 */
class D3d11Texture2D extends D3d11Resource
{
    /**
     * Get the properties of the texture resource.
     * @param _description Pointer to a resource description (see `D3D11_TEXTURE2D_DESC`).
     */
    public function getDescription(_description : D3d11Texture2DDescription) : Void
    {
        (cast ptr : Star<NativeID3D11Texture2D>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11Texture2D')
extern class NativeID3D11Texture2D extends NativeID3D11Resource
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(NativeID3D11Texture2D)');
    }

    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11Texture2DDescription>) : Void;
}
