package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import d3d11.constants.D3d11Error;
import d3d11.structures.D3d11RasterizerDescription;
import d3d11.structures.D3d11BlendDescription;
import d3d11.interfaces.D3d11RasterizerState;
import d3d11.interfaces.D3d11BlendState;

using cpp.Native;

/**
 * The device interface represents a virtual adapter; it is used to create resources.
 */
class D3d11Device extends Unknown
{
    /**
     * Create a rasterizer state object that tells the rasterizer stage how to behave.
     * @param _description Pointer to a rasterizer state description (see `D3D11_RASTERIZER_DESC`).
     * @param _state Address of a pointer to the rasterizer state object created (see `ID3D11RasterizerState`).
     * @return This method returns `E_OUTOFMEMORY` if there is insufficient memory to create the compute shader. See Direct3D 11 Return Codes for other possible return values.
     */
    public function createRasterizerState(_description : D3d11RasterizerDescription, _state : D3d11RasterizerState) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createRasterizerState(_description.backing, cast _state.ptr.addressOf());
    }

    /**
     * Create a blend-state object that encapsules blend state for the output-merger stage.
     * @param _desciption Pointer to a blend-state description (see `D3D11_BLEND_DESC`).
     * @param _state Address of a pointer to the blend-state object created (see `ID3D11BlendState`).
     * @return This method returns `E_OUTOFMEMORY` if there is insufficient memory to create the blend-state object. See Direct3D 11 Return Codes for other possible return values.
     */
    public function createBlendState(_desciption : D3d11BlendDescription, _state : D3d11BlendState) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createBlendState(_desciption.backing, cast _state.ptr.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11Device')
extern class NativeID3D11Device extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11Device)');
    }

    @:native('CreateRasterizerState')
    function createRasterizerState(_rasterizerState : Star<NativeD3D11RasterizerDescription>, _ptr : Star<Star<NativeID3D11RasterizerState>>) : Int;

    @:native('CreateBlendState')
    function createBlendState(_blendState : Star<NativeD3D11BlendDescription>, _ptr : Star<Star<NativeID3D11BlendState>>) : Int;
}
