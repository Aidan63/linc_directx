package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import d3d11.interfaces.D3d11Resourse;
import d3d11.structures.D3d11DepthStencilDescription;

/**
 * The depth-stencil-state interface holds a description for depth-stencil state that you can bind to the output-merger stage.
 */
class D3d11DepthStencilState extends D3d11Resource
{
    /**
     * Gets the description for depth-stencil state that you used to create the depth-stencil-state object.
     * @param _description A pointer to a `D3D11_DEPTH_STENCIL_DESC` structure that receives a description of the depth-stencil state.
     */
    public function getDescription(_description : D3d11DepthStencilDescription) : Void
    {
        (cast ptr : Star<NativeID3D11DepthStencilState>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11DepthStencilState')
extern class NativeID3D11DepthStencilState extends NativeID3D11Resource
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11DepthStencilState)');
    }

    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11DepthStencilDescription>) : Void;
}
