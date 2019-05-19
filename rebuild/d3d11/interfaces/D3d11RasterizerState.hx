package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import d3d11.structures.D3d11RasterizerDescription;

/**
 * The rasterizer-state interface holds a description for rasterizer state that you can bind to the rasterizer stage.
 */
class D3d11RasterizerState extends Unknown
{
    /**
     * Gets the description for rasterizer state that you used to create the rasterizer-state object.
     * @param _description A pointer to a D3D11_RASTERIZER_DESC structure that receives a description of the rasterizer state.
     */
    public function getDescription(_description : D3d11RasterizerDescription)
    {
        return (cast ptr : Star<NativeID3D11RasterizerState>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11RasterizerState')
extern class NativeID3D11RasterizerState extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11RasterizerState)');
    }

    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11RasterizerDescription>) : Void;
}
