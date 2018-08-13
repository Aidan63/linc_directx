package d3d.d3d11;

import d3d.d3d11.InputElementDescription.InputElementDescriptionArray;
import com.IUnknown;

@:unreflective
@:native("::cpp::Pointer<ID3D11Device>")
@:include("d3d11.h")
extern class Device extends IUnknown
{
    inline function createTexture2D(_description : Texture2DDesc, _initialData : SubResourceData, _texture2D : Texture2D) : Int
    {
        return untyped __cpp__('{0}->ptr->CreateTexture2D((D3D11_TEXTURE2D_DESC*)&{1}, (D3D11_SUBRESOURCE_DATA*)&{2}, (ID3D11Texture2D**)&{3})', this, _description, _initialData, _texture2D);
    }

    inline function createBuffer(_description : BufferDescription, _initialData : SubResourceData, _buffer : Buffer) : Int
    {
        return untyped __cpp__('{0}->ptr->CreateBuffer((D3D11_BUFFER_DESC*)&{1}, (D3D11_SUBRESOURCE_DATA*)&{2}, (ID3D11Buffer**)&{3})', this, _description, _initialData, _buffer);
    }

    inline function createRenderTargetView(_resource : Texture2D, _view : RenderTargetView) : Int
    {
        return untyped __cpp__('{0}->ptr->CreateRenderTargetView((ID3D11Texture2D*){1}, nullptr, (ID3D11RenderTargetView**)&{2})', this, _resource, _view);
    }

    inline function createShaderResourceView(_resource : Texture2D, _view : ShaderResourceView) : Int
    {
        return untyped __cpp__('{0}->ptr->CreateShaderResourceView((ID3D11Texture2D*){1}, nullptr, (ID3D11ShaderResourceView**)&{2})', this, _resource, _view);
    }
    
    inline function createInputLayout(_description : InputElementDescriptionArray, _shaderBytecode : cpp.Pointer<cpp.Void>, _bytecodeLength : Int, _inputLayout : InputLayout) : Int
    {
        return untyped __cpp__('{0}->ptr->CreateInputLayout({1}.data(), {1}.size(), (const void*){2}, {3}, (ID3D11InputLayout**)&{4})', this, _description, _shaderBytecode, _bytecodeLength, _inputLayout);
    }

    inline function createVertexShader(_shaderBytecode : cpp.Pointer<cpp.Void>, _bytecodeLength : Int, _vertexShader : VertexShader) : Int
    {
        return untyped __cpp__('{0}->ptr->CreateVertexShader((const void*){1}, {2}, nullptr, (ID3D11VertexShader**)&{3})', this, _shaderBytecode, _bytecodeLength, _vertexShader);
    }

    inline function createPixelShader(_shaderBytecode : cpp.Pointer<cpp.Void>, _bytecodeLength : Int, _pixelShader : PixelShader) : Int
    {
        return untyped __cpp__('{0}->ptr->CreatePixelShader((const void*){1}, {2}, nullptr, (ID3D11PixelShader**)&{3})', this, _shaderBytecode, _bytecodeLength, _pixelShader);
    }
}
