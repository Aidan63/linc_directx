package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import d3d11.structures.D3d11BlendDescription;

/**
 * The rasterizer-state interface holds a description for rasterizer state that you can bind to the rasterizer stage.
 */
class D3d11BlendState extends Unknown
{
    /**
     * Gets the description for blending state that you used to create the blend-state object.
     * @param _description A pointer to a `D3D11_BLEND_DESC` structure that receives a description of the blend state.
     */
    public function getDescription(_description : D3d11BlendDescription)
    {
        return (cast ptr : Star<NativeID3D11BlendState>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11BlendState')
extern class NativeID3D11BlendState extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11BlendState)');
    }

    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11BlendDescription>) : Void;
}
