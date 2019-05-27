package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import d3d11.interfaces.D3d11Resourse;
import d3d11.structures.D3d11DepthStencilViewDescription;

/**
 * A 2D texture interface manages texel data, which is structured memory.
 */
class D3d11DepthStencilView extends D3d11Resource
{
    /**
     * Get the depth-stencil view.
     * @param _description Pointer to a depth-stencil-view description (see `D3D11_DEPTH_STENCIL_VIEW_DESC`).
     */
    public function getDescription(_description : D3d11DepthStencilViewDescription) : Void
    {
        (cast ptr : Star<NativeID3D11DepthStencilView>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11DepthStencilView')
extern class NativeID3D11DepthStencilView extends NativeID3D11Resource
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11DepthStencilView)');
    }

    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11DepthStencilViewDescription>) : Void;
}
