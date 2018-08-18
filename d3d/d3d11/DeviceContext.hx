package d3d.d3d11;

import dxgi.DXGI.DXGI_FORMAT;
import d3d.D3DCommon.D3D_PRIMITIVE_TOPOLOGY;
import d3d.d3d11.D3D11.D3D11_MAP;
import com.IUnknown;
import cpp.Star;

typedef DeviceContext = Star<DeviceContextRef>;

@:unreflective
@:native("ID3D11DeviceContext")
@:include("d3d11.h")
private extern class DeviceContextRef extends IUnknown
{
    inline function draw(_vertexCount : Int, _startVertexLocation : Int) : Void
    {
        untyped __cpp__('{0}->Draw({1}, {2})', this, _vertexCount, _startVertexLocation);
    }

    inline function drawIndexed(_indexCount : Int, _startIndexLocation : Int, _baseVertexLocation : Int) : Void
    {
        untyped __cpp__('{0}->DrawIndexed({1}, {2}, {3})', this, _indexCount, _startIndexLocation, _baseVertexLocation);
    }

    inline function iaSetInputLayout(_layout : InputLayout) : Void
    {
        untyped __cpp__('{0}->IASetInputLayout({1})', this, _layout);
    }

    inline function iaSetPrimitiveTopology(_topology : D3D_PRIMITIVE_TOPOLOGY) : Void
    {
        untyped __cpp__('{0}->IASetPrimitiveTopology({1})', this, _topology);
    }

    inline function iaSetVertexBuffer(_startSlot : Int, _vertexBuffer : Buffer, _stride : Int, _offset : Int) : Void
    {
        untyped __cpp__('{0}->IASetVertexBuffers({1}, 1, (ID3D11Buffer**)&{2}, (UINT*)&{3}, (UINT*)&{4})', this, _startSlot, _vertexBuffer, _stride, _offset);
    }

    inline function iaSetIndexBuffer(_indexBuffer : Buffer, _format : DXGI_FORMAT, _offset : Int) : Void
    {
        untyped __cpp__('{0}->IASetIndexBuffer({1}, {2}, {3})', this, _indexBuffer, _format, _offset);
    }

    inline function omSetRenderTargets(_views : RenderTargetView) : Void
    {
        untyped __cpp__('{0}->OMSetRenderTargets(1, (ID3D11RenderTargetView**)&{1}, NULL)', this, _views);
    }

    inline function rsSetViewports(_viewport : Viewport) : Void
    {
        untyped __cpp__('{0}->RSSetViewports(1, (D3D11_VIEWPORT*)&{1})', this, _viewport);
    }

    inline function vsSetConstantBuffer(_startSlot : Int, _constantBuffer : Buffer) : Void
    {
        untyped __cpp__('{0}->VSSetConstantBuffers({1}, 1, (ID3D11Buffer**)&{2})', this, _startSlot, _constantBuffer);
    }

    inline function vsSetShader(_shader : VertexShader) : Void
    {
        untyped __cpp__('{0}->VSSetShader((ID3D11VertexShader*){1}, 0, 0)', this, _shader);
    }

    inline function psSetShader(_shader : PixelShader) : Void
    {
        untyped __cpp__('{0}->PSSetShader((ID3D11PixelShader*){1}, 0, 0)', this, _shader);
    }

    inline function psSetShaderResource(_slot : Int, _resouce : ShaderResourceView) : Void
    {
        untyped __cpp__('{0}->PSSetShaderResources({1}, 1, (ID3D11ShaderResourceView**)&{2})', this, _slot, _resouce);
    }

    inline function clearRenderTargetView(_viewport : RenderTargetView, _color : Array<cpp.Float32>) : Void
    {
        untyped __cpp__('{0}->ClearRenderTargetView((ID3D11RenderTargetView*){1}, (FLOAT*){2})', this, _viewport, cpp.Pointer.ofArray(_color));
    }

    inline function map(_resource : Buffer, _subresource : Int, _mapType : D3D11_MAP, _mapFlag : Int, _mappedResource : MappedSubResource) : Int
    {
        return untyped __cpp__('{0}->Map({1}, {2}, {3}, {4}, &{5})', this, _resource, _subresource, _mapType, _mapFlag, _mappedResource);
    }

    inline function unmap(_resource : Buffer, _subresource : Int) : Void
    {
        untyped __cpp__('{0}->Unmap({1}, {2})', this, _resource, _subresource);
    }

    inline function rsSetState(_state : RasterizerState) : Void
    {
        untyped __cpp__('{0}->RSSetState({1})', this, _state);
    }

    inline function omSetBlendState(_blendState : BlendState, _blendFactor : Array<cpp.Float32>, _sampleMask : Int) : Void
    {
        untyped __cpp__('{0}->OMSetBlendState({1}, (FLOAT*){2}, {3})', this, _blendState, cpp.Pointer.ofArray(_blendFactor), _sampleMask);
    }

    inline function rsSetScissorRect(_rect : Rect) : Void
    {
        untyped __cpp__('{0}->RSSetScissorRects(1, &{1})', this, _rect);
    }

    inline function psSetSampler(_startSlot : Int, _sampler : SamplerState) : Void
    {
        untyped __cpp__('{0}->PSSetSamplers({1}, 1, (ID3D11SamplerState**)&{2})', this, _startSlot, _sampler);
    }
}
