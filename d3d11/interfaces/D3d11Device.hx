package d3d11.interfaces;

import cpp.Star;
import cpp.ConstPointer;
import com.GUID;
import com.Unknown;
import d3dcommon.interfaces.D3dBlob;
import d3d11.interfaces.D3d11DepthStencilState.NativeID3D11DepthStencilState;
import d3d11.structures.D3d11DepthStencilDescription;
import d3d11.interfaces.D3d11InputLayout;
import d3d11.interfaces.D3d11VertexShader;
import d3d11.interfaces.D3d11PixelShader;
import d3d11.interfaces.D3d11ClassLinkage;
import d3d11.interfaces.D3d11SamplerState;
import d3d11.structures.D3d11SamplerDescription;
import d3d11.interfaces.D3d11ShaderResourceView;
import d3d11.structures.D3d11ShaderResourceViewDescription;
import d3d11.interfaces.D3d11RenderTargetView;
import d3d11.structures.D3d11RenderTargetViewDescription;
import d3d11.structures.D3d11InputElementDescription;
import d3d11.constants.D3d11Error;
import d3d11.structures.D3d11RasterizerDescription;
import d3d11.structures.D3d11BlendDescription;
import d3d11.structures.D3d11BufferDescription;
import d3d11.structures.D3d11SubResourceData;
import d3d11.structures.D3d11Texture2DDescription;
import d3d11.structures.D3d11DepthStencilViewDescription;
import d3d11.interfaces.D3d11RasterizerState;
import d3d11.interfaces.D3d11BlendState;
import d3d11.interfaces.D3d11Buffer;
import d3d11.interfaces.D3d11Texture2D;
import d3d11.interfaces.D3d11Resourse;
import d3d11.interfaces.D3d11DepthStencilView;

using cpp.Native;

/**
 * The device interface represents a virtual adapter; it is used to create resources.
 */
class D3d11Device extends Unknown
{
    final vectorInputLayout : StdVectorInputElementDescription;

    public function new()
    {
        super();

        vectorInputLayout = StdVectorInputElementDescription.create();
    }

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

    /**
     * Create an array of 2D textures.
     * @param _description A pointer to a `D3D11_TEXTURE2D_DESC` structure that describes a 2D texture resource.
     * To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description.
     * To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param _initialData A pointer to an array of `D3D11_SUBRESOURCE_DATA` structures that describe subresources for the 2D texture resource.
     * Applications can't specify NULL for pInitialData when creating `IMMUTABLE` resources (see `D3D11_USAGE`).
     * If the resource is multisampled, pInitialData must be NULL because multisampled resources cannot be initialized with data when they are created.
     * 
     * If you don't pass anything to pInitialData, the initial content of the memory for the resource is undefined.
     * In this case, you need to write the resource content some other way before the resource is read.
     * 
     * You can determine the size of this array from values in the MipLevels and ArraySize members of the `D3D11_TEXTURE2D_DESC` structure to which pDesc points by using the following calculation:
     * 
     * `MipLevels * ArraySize`
     * 
     * For more information about this array size, see Remarks.
     * @param _texture A pointer to a buffer that receives a pointer to a `ID3D11Texture2D` interface for the created texture.
     * Set this parameter to NULL to validate the other input parameters (the method will return `S_FALSE` if the other input parameters pass validation).
     * @return If the method succeeds, the return code is `S_OK`. See Direct3D 11 Return Codes for failing error codes.
     */
    public function createTexture2D(_description : D3d11Texture2DDescription, _initialData : Null<D3d11SubResourceData>, _texture : D3d11Texture2D) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createTexture2D(_description.backing, _initialData != null ? _initialData.backing : null, cast _texture.ptr.addressOf());
    }

    /**
     * Create a depth-stencil view for accessing resource data.
     * @param _resource Pointer to the resource that will serve as the depth-stencil surface. This resource must have been created with the `D3D11_BIND_DEPTH_STENCIL` flag.
     * @param _description Pointer to a depth-stencil-view description (see `D3D11_DEPTH_STENCIL_VIEW_DESC`). Set this parameter to NULL to create a view that accesses mipmap level 0 of the entire resource (using the format the resource was created with).
     * @param _view Address of a pointer to an `ID3D11DepthStencilView`. Set this parameter to NULL to validate the other input parameters (the method will return `S_FALSE` if the other input parameters pass validation).
     * @return This method returns one of the following Direct3D 11 Return Codes.
     */
    public function createDepthStencilView(_resource : D3d11Resource, _description : Null<D3d11DepthStencilViewDescription>, _view : D3d11DepthStencilView) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createDepthStencilView(cast _resource.ptr, _description != null ? _description.backing : null, cast _view.ptr.addressOf());
    }

    /**
     * Creates a render-target view for accessing resource data.
     * @param _resource Pointer to a `ID3D11Resource` that represents a render target. This resource must have been created with the `D3D11_BIND_RENDER_TARGET` flag.
     * @param _description Pointer to a `D3D11_RENDER_TARGET_VIEW_DESC` that represents a render-target view description. Set this parameter to NULL to create a view that accesses all of the subresources in mipmap level 0.
     * @param _view Address of a pointer to an `ID3D11RenderTargetView`. Set this parameter to NULL to validate the other input parameters (the method will return `S_FALSE` if the other input parameters pass validation).
     * @return This method returns one of the Direct3D 11 Return Codes.
     */
    public function createRenderTargetView(_resource : D3d11Resource, _description : Null<D3d11RenderTargetViewDescription>, _view : D3d11RenderTargetView) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createRenderTargetView(cast _resource.ptr, _description != null ? _description.backing : null, cast _view.ptr.addressOf());
    }

    /**
     * Create a shader-resource view for accessing data in a resource.
     * @param _resource Pointer to the resource that will serve as input to a shader. This resource must have been created with the `D3D11_BIND_SHADER_RESOURCE` flag.
     * @param _description Pointer to a shader-resource view description (see `D3D11_SHADER_RESOURCE_VIEW_DESC`). Set this parameter to NULL to create a view that accesses the entire resource (using the format the resource was created with).
     * @param _view Address of a pointer to an `ID3D11ShaderResourceView`. Set this parameter to NULL to validate the other input parameters (the method will return `S_FALSE` if the other input parameters pass validation).
     * @return This method returns one of the following Direct3D 11 Return Codes.
     */
    public function createShaderResourceView(_resource : D3d11Resource, _description : Null<D3d11ShaderResourceViewDescription>, _view : D3d11ShaderResourceView) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createShaderResourceView(cast _resource.ptr, _description != null ? _description.backing : null, cast _view.ptr.addressOf());
    }

    /**
     * Create a sampler-state object that encapsulates sampling information for a texture.
     * @param _description Pointer to a sampler state description (see `D3D11_SAMPLER_DESC`).
     * @param _sampler Address of a pointer to the sampler state object created (see `ID3D11SamplerState`).
     * @return This method returns one of the following Direct3D 11 Return Codes.
     */
    public function createSamplerState(_description : D3d11SamplerDescription, _sampler : D3d11SamplerState) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createSamplerState(_description.backing, cast _sampler.ptr.addressOf());
    }

    /**
     * Create a vertex-shader object from a compiled shader.
     * @param _shaderBytecode A pointer to the compiled shader.
     * @param _bytecodeLength Size of the compiled vertex shader.
     * @param _classLinkage A pointer to a class linkage interface (see `ID3D11ClassLinkage`); the value can be NULL.
     * @param _vertexShader Address of a pointer to a `ID3D11VertexShader` interface.
     * If this is NULL, all other parameters will be validated, and if all parameters pass validation this API will return `S_FALSE` instead of `S_OK`.
     * @return This method returns one of the Direct3D 11 Return Codes.
     */
    public function createVertexShader(_shaderBytecode : ConstPointer<cpp.Void>, _bytecodeLength : Int, _classLinkage : Null<D3d11ClassLinkage>, _vertexShader : D3d11VertexShader) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createVertexShader(_shaderBytecode.ptr, _bytecodeLength, _classLinkage == null ? null : cast _classLinkage.ptr, cast _vertexShader.ptr.addressOf());
    }

    /**
     * Create a pixel shader.
     * @param _shaderBytecode A pointer to the compiled shader.
     * @param _bytecodeLength Size of the compiled pixel shader.
     * @param _classLinkage A pointer to a class linkage interface (see `ID3D11ClassLinkage`); the value can be NULL.
     * @param _pixelShader Address of a pointer to a ID3D11PixelShader interface.
     * If this is NULL, all other parameters will be validated, and if all parameters pass validation this API will return `S_FALSE` instead of `S_OK`.
     * @return This method returns one of the following Direct3D 11 Return Codes.
     */
    public function createPixelShader(_shaderBytecode : ConstPointer<cpp.Void>, _bytecodeLength : Int, _classLinkage : Null<D3d11ClassLinkage>, _pixelShader : D3d11PixelShader) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createPixelShader(_shaderBytecode.ptr, _bytecodeLength, _classLinkage == null ? null : cast _classLinkage.ptr, cast _pixelShader.ptr.addressOf());
    }

    /**
     * Create an input-layout object to describe the input-buffer data for the input-assembler stage.
     * @param _inputElementDescriptions An array of the input-assembler stage input data types; each type is described by an element description (see `D3D11_INPUT_ELEMENT_DESC`).
     * @param _shaderBytecodeWithInputSignature A pointer to the compiled shader. The compiled shader code contains a input signature which is validated against the array of elements. See remarks.
     * @param _bytecodeLength Size of the compiled shader.
     * @param _inputLayout A pointer to the input-layout object created (see `ID3D11InputLayout`). To validate the other input parameters, set this pointer to be NULL and verify that the method returns `S_FALSE`.
     * @return If the method succeeds, the return code is `S_OK`. See Direct3D 11 Return Codes for failing error codes.
     */
    public function createInputLayout(_inputElementDescriptions : Array<D3d11InputElementDescription>, _blob : D3dBlob, _inputLayout : D3d11InputLayout) : D3d11Error
    {
        for (i in 0..._inputElementDescriptions.length)
        {           
            vectorInputLayout.push_back(_inputElementDescriptions[i].backing);
        }

        return (cast ptr : Star<NativeID3D11Device>).createInputLayout(vectorInputLayout.data(), _inputElementDescriptions.length, _blob.getBufferPointer().ptr, _blob.getBufferSize(), cast _inputLayout.ptr.addressOf());
    }

    /**
     * Create a depth-stencil state object that encapsulates depth-stencil test information for the output-merger stage.
     * @param _description Pointer to a depth-stencil state description (see `D3D11_DEPTH_STENCIL_DESC`).
     * @param _state Address of a pointer to the depth-stencil state object created (see `ID3D11DepthStencilState`).
     * @return This method returns one of the following Direct3D 11 Return Codes.
     */
    public function createDepthStencilState(_description : D3d11DepthStencilDescription, _state : D3d11DepthStencilState) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11Device>).createDepthStencilState(_description.backing, cast _state.ptr.addressOf());
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

    @:native('CreateTexture2D')
    function createTexture2D(_desciption : Star<NativeD3D11Texture2DDescription>, _initialData : Star<NativeD3D11SubResourceData>, _texture : Star<Star<NativeID3D11Texture2D>>) : Int;

    @:native('CreateDepthStencilView')
    function createDepthStencilView(_resource : Star<NativeID3D11Resource>, _description : Star<NativeD3D11DepthStencilViewDescription>, _view : Star<Star<NativeID3D11DepthStencilView>>) : Int;

    @:native('CreateRenderTargetView')
    function createRenderTargetView(_resource : Star<NativeID3D11Resource>, _description : Star<NativeD3D11RenderTargetViewDescription>, _view : Star<Star<NativeID3D11RenderTargetView>>) : Int;

    @:native('CreateShaderResourceView')
    function createShaderResourceView(_resource : Star<NativeID3D11Resource>, _desciption : Star<NativeD3D11ShaderResourceViewDescription>, _view : Star<Star<NativeID3D11ShaderResourceView>>) : Int;

    @:native('CreateSamplerState')
    function createSamplerState(_desciption : Star<NativeD3D11SamplerDescription>, _sampler : Star<Star<NativeID3D11SamplerState>>) : Int;

    @:native('CreateVertexShader')
    function createVertexShader(_shaderBytecode : Star<cpp.Void>, _bytecodeLength : cpp.SizeT, _classLinkage : Star<NativeID3D11ClassLinkage>, _vertexShader : Star<Star<NativeID3D11VertexShader>>) : Int;

    @:native('CreatePixelShader')
    function createPixelShader(_shaderBytecode : Star<cpp.Void>, _bytecodeLength : cpp.SizeT, _classLinkage : Star<NativeID3D11ClassLinkage>, _vertexShader : Star<Star<NativeID3D11PixelShader>>) : Int;

    @:native('CreateInputLayout')
    function createInputLayout(_inputElementDescriptions : Star<NativeD3D11InputElementDescription>, _numElements : Int, _shaderBytecodeWithInputSignature : Star<cpp.Void>, _bytecodeLength : cpp.SizeT, _inputLayout : Star<Star<NativeID3D11InputLayout>>) : Int;

    @:native('CreateDepthStencilState')
    function createDepthStencilState(_desciption : Star<NativeD3D11DepthStencilDescription>, _state : Star<Star<NativeID3D11DepthStencilState>>) : Int;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<D3D11_INPUT_ELEMENT_DESC>')
private extern class StdVectorInputElementDescription
{
    @:native('std::vector<D3D11_INPUT_ELEMENT_DESC>')
    static function create() : StdVectorInputElementDescription;

    function data() : Star<NativeD3D11InputElementDescription>;

    function push_back(_item : NativeD3D11InputElementDescription) : Void;

    function clear() : Void;
}
