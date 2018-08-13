package d3d.d3d11;

import dxgi.DXGI.DXGI_FORMAT;
import d3d.D3DCommon.D3D_PRIMITIVE_TOPOLOGY;
import com.IUnknown;

@:unreflective
@:native("::cpp::Pointer<ID3D11DeviceContext>")
@:include("d3d11.h")
extern class DeviceContext extends IUnknown
{
    inline function draw(_vertexCount : Int, _startVertexLocation : Int) : Void
    {
        untyped __cpp__('{0}->ptr->Draw({1}, {2})', this, _vertexCount, _startVertexLocation);
    }

    inline function drawIndexed(_indexCount : Int, _startIndexLocation : Int, _baseVertexLocation : Int) : Void
    {
        untyped __cpp__('{0}->ptr->DrawIndexed({1}, {2}, {3})', this, _indexCount, _startIndexLocation, _baseVertexLocation);
    }

    inline function iaSetInputLayout(_layout : InputLayout) : Void
    {
        untyped __cpp__('{0}->ptr->IASetInputLayout((ID3D11InputLayout*){1})', this, _layout);
    }

    inline function iaSetPrimitiveTopology(_topology : D3D_PRIMITIVE_TOPOLOGY) : Void
    {
        untyped __cpp__('{0}->ptr->IASetPrimitiveTopology({1})', this, _topology);
    }

    inline function iaSetVertexBuffer(_startSlot : Int, _vertexBuffer : Buffer, _stride : Int, _offset : Int) : Void
    {
        untyped __cpp__('{0}->ptr->IASetVertexBuffers({1}, 1, (ID3D11Buffer**)&{2}, (UINT*)&{3}, (UINT*)&{4})', this, _startSlot, _vertexBuffer, _stride, _offset);
    }

    inline function iaSetIndexBuffer(_indexBuffer : Buffer, _format : DXGI_FORMAT, _offset : Int) : Void
    {
        untyped __cpp__('{0}->ptr->IASetIndexBuffer((ID3D11Buffer*){1}, {2}, {3})', this, _indexBuffer, _format, _offset);
    }

    inline function omSetRenderTargets(_views : RenderTargetView) : Void
    {
        untyped __cpp__('{0}->ptr->OMSetRenderTargets(1, (ID3D11RenderTargetView**)&{1}, NULL)', this, _views);
    }

    inline function rsSetViewports(_viewport : Viewport) : Void
    {
        untyped __cpp__('{0}->ptr->RSSetViewports(1, (D3D11_VIEWPORT*)&{1})', this, _viewport);
    }

    inline function vsSetConstantBuffer(_startSlot : Int, _constantBuffer : Buffer) : Void
    {
        untyped __cpp__('{0}->ptr->VSSetConstantBuffers({1}, 1, (ID3D11Buffer**)&{2})', this, _startSlot, _constantBuffer);
    }

    inline function vsSetShader(_shader : VertexShader) : Void
    {
        untyped __cpp__('{0}->ptr->VSSetShader((ID3D11VertexShader*){1}, 0, 0)', this, _shader);
    }

    inline function psSetShader(_shader : PixelShader) : Void
    {
        untyped __cpp__('{0}->ptr->PSSetShader((ID3D11PixelShader*){1}, 0, 0)', this, _shader);
    }

    inline function psSetShaderResource(_slot : Int, _resouce : ShaderResourceView) : Void
    {
        untyped __cpp__('{0}->ptr->PSSetShaderResources({1}, 1, (ID3D11ShaderResourceView**)&{2})', this, _slot, _resouce);
    }

    inline function clearRenderTargetView(_viewport : RenderTargetView, _color : Array<cpp.Float32>) : Void
    {
        untyped __cpp__('{0}->ptr->ClearRenderTargetView((ID3D11RenderTargetView*){1}, (FLOAT*){2})', this, _viewport, cpp.Pointer.ofArray(_color));
    }
}
