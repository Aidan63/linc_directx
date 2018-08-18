package d3d.d3d11;

import d3d.d3d11.InputElementDescription.InputElementDescriptionArray;
import com.IUnknown;
import cpp.Star;

typedef Device = Star<DeviceRef>;

@:unreflective
@:native("ID3D11Device")
@:include("d3d11.h")
private extern class DeviceRef extends IUnknown
{
    inline function createTexture2D(_description : Texture2DDesc, _initialData : SubResourceData, _texture2D : Star<Texture2D>) : Int
    {
        return untyped __cpp__('{0}->CreateTexture2D(&{1}, &{2}, (ID3D11Texture2D**){3})', this, _description, _initialData, _texture2D);
    }

    inline function createBuffer(_description : BufferDescription, _buffer : Star<Buffer>) : Int
    {
        return untyped __cpp__('{0}->CreateBuffer(&{1}, nullptr, (ID3D11Buffer**){2})', this, _description, _buffer);
    }

    inline function createBufferData(_description : BufferDescription, _initialData : SubResourceData, _buffer : Star<Buffer>) : Int
    {
        return untyped __cpp__('{0}->CreateBuffer(&{1}, &{2}, (ID3D11Buffer**){3})', this, _description, _initialData, _buffer);
    }

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

    inline function createRasterizerState(_description : RasterizerDescription, _state : Star<RasterizerState>) : Int
    {
        return untyped __cpp__('{0}->CreateRasterizerState(&{1}, (ID3D11RasterizerState**){2})', this, _description, _state);
    }

    inline function createBlendState(_blendStateDescription : BlendDescription, _blendState : Star<BlendState>) : Int
    {
        return untyped __cpp__('{0}->CreateBlendState(&{1}, (ID3D11BlendState**){2})', this, _blendStateDescription, _blendState);
    }

    inline function createSamplerState(_samplerDescription : SamplerDescription, _samplerState : Star<SamplerState>) : Int
    {
        return untyped __cpp__('{0}->CreateSamplerState(&{1}, (ID3D11SamplerState**){2})', this, _samplerDescription, _samplerState);
    }
}
