package d3d11.interfaces;

import com.GUID;
import cpp.Star;
import com.Unknown;
import d3d11.structures.D3d11RenderTargetViewDescription;

/**
 * A render-target-view interface identifies the render-target subresources that can be accessed during rendering.
 */
class D3d11RenderTargetView extends Unknown
{
    /**
     * Get the properties of a render target view.
     * @param _description Pointer to the description of a render target view (see `D3D11_RENDER_TARGET_VIEW_DESC`).
     */
    public function getDesc(_description : D3d11RenderTargetViewDescription)
    {
        (cast ptr : Star<NativeID3D11RenderTargetView>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11RenderTargetView')
extern class NativeID3D11RenderTargetView extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11RenderTargetView)');
    }

    @:native('GetDesc')
    function getDescription(_desc : Star<NativeD3D11RenderTargetViewDescription>) : Void;
}
