package d3d11.interfaces;

import cpp.Star;
import d3d11.interfaces.D3d11Resourse;
import d3d11.structures.D3d11ShaderResourceViewDescription;

/**
 * A shader-resource-view interface specifies the subresources a shader can access during rendering.
 * Examples of shader resources include a constant buffer, a texture buffer, and a texture.
 */
class D3d11ShaderResourceView extends D3d11Resource
{
    /**
     * Get the shader resource view's description.
     * @param _description A pointer to a `D3D11_SHADER_RESOURCE_VIEW_DESC` structure to be filled with data about the shader resource view.
     */
    public function getDescription(_description : D3d11ShaderResourceViewDescription)
    {
        (cast ptr : Star<NativeID3D11ShaderResourceView>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11ShaderResourceView')
extern class NativeID3D11ShaderResourceView extends NativeID3D11Resource
{
    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11ShaderResourceViewDescription>) : Void;
}
