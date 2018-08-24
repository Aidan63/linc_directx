package d3d.d3d11;

import d3d.d3d11.InputElementDescription;
import com.IUnknown;
import cpp.Star;

typedef Device = Star<DeviceRef>;

@:unreflective
@:structAccess
@:native("ID3D11Device")
@:include("d3d11.h")
private extern class DeviceRef extends IUnknownRef
{
    @:native('CreateTexture2D')
    function createTexture2D(_description : Star<Texture2DDescription>, _initialData : Star<SubResourceData>, _texture2D : Star<Texture2D>) : Int;

    @:native('CreateBuffer')
    function createBuffer(_description : Star<BufferDescription>, _initialData : Star<SubResourceData>, _buffer : Star<Buffer>) : Int;

    inline function createRenderTargetView(_resource : Texture2D, _view : Star<RenderTargetView>) : Int
    {
        return untyped __cpp__('{0}->CreateRenderTargetView({1}, nullptr, (ID3D11RenderTargetView**){2})', this, _resource, _view);
    }

    inline function createShaderResourceView(_resource : Texture2D, _view : Star<ShaderResourceView>) : Int
    {
        return untyped __cpp__('{0}->CreateShaderResourceView({1}, nullptr, (ID3D11ShaderResourceView**){2})', this, _resource, _view);
    }
    
    inline function createInputLayout(_description : InputElementDescriptionArray, _shaderBytecode : Star<cpp.Void>, _bytecodeLength : Int, _inputLayout : Star<InputLayout>) : Int
    {
        return untyped __cpp__('{0}->CreateInputLayout({1}.data(), {1}.size(), {2}, {3}, (ID3D11InputLayout**){4})', this, _description, _shaderBytecode, _bytecodeLength, _inputLayout);
    }

    inline function createVertexShader(_shaderBytecode : Star<cpp.Void>, _bytecodeLength : Int, _vertexShader : Star<VertexShader>) : Int
    {
        return untyped __cpp__('{0}->CreateVertexShader({1}, {2}, nullptr, (ID3D11VertexShader**){3})', this, _shaderBytecode, _bytecodeLength, _vertexShader);
    }

    inline function createPixelShader(_shaderBytecode : Star<cpp.Void>, _bytecodeLength : Int, _pixelShader : Star<PixelShader>) : Int
    {
        return untyped __cpp__('{0}->CreatePixelShader({1}, {2}, nullptr, (ID3D11PixelShader**){3})', this, _shaderBytecode, _bytecodeLength, _pixelShader);
    }

    @:native('CreateRasterizerState')
    function createRasterizerState(_description : Star<RasterizerDescription>, _state : Star<RasterizerState>) : Int;

    @:native('CreateBlendState')
    function createBlendState(_blendStateDescription : Star<BlendDescription>, _blendState : Star<BlendState>) : Int;

    @:native('CreateSamplerState')
    function createSamplerState(_samplerDescription : Star<SamplerDescription>, _samplerState : Star<SamplerState>) : Int;
}
