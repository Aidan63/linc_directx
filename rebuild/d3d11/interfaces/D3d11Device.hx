package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import d3d11.constants.D3d11Error;
import d3d11.structures.D3d11RasterizerDescription;
import d3d11.structures.D3d11BlendDescription;
import d3d11.structures.D3d11BufferDescription;
import d3d11.structures.D3d11SubResourceData;
import d3d11.interfaces.D3d11RasterizerState;
import d3d11.interfaces.D3d11BlendState;
import d3d11.interfaces.D3d11Buffer;

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

    /**
     * Creates a buffer (vertex buffer, index buffer, or shader-constant buffer).
     * @param _description A pointer to a `D3D11_BUFFER_DESC` structure that describes the buffer.
     * @param _initialData A pointer to a `D3D11_SUBRESOURCE_DATA` structure that describes the initialization data;
     * use NULL to allocate space only (with the exception that it cannot be NULL if the usage flag is D3D11_USAGE_IMMUTABLE).
     * If you don't pass anything to pInitialData, the initial content of the memory for the buffer is undefined.
     * In this case, you need to write the buffer content some other way before the resource is read.
     * @param _buffer Address of a pointer to the ID3D11Buffer interface for the buffer object created.
     * Set this parameter to NULL to validate the other input parameters (`S_FALSE` indicates a pass).
     * @return This method returns `E_OUTOFMEMORY` if there is insufficient memory to create the buffer. See Direct3D 11 Return Codes for other possible return values.
     */
    public function createBuffer(_description : D3d11BufferDescription, _initialData : Null<D3d11SubResourceData>, _buffer : D3d11Buffer) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createBuffer(_description.backing, _initialData != null ? _initialData.backing : null, cast _buffer.ptr.addressOf());
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

    @:native('CreateBuffer')
    function createBuffer(_description : Star<NativeD3D11BufferDescription>, _initialData : Star<NativeD3D11SubResourceData>, _buffer : Star<Star<NativeID3D11Buffer>>) : Int;
}
