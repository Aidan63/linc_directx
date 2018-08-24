package d3d11;

import d3dcommon.D3DCommon;
import d3d11.D3D11;
import d3d11.resources.*;
import dxgi.DXGI;
import com.IUnknown;
import cpp.Star;

typedef DeviceContext = Star<DeviceContextRef>;

@:unreflective
@:structAccess
@:native("ID3D11DeviceContext")
@:include("d3d11.h")
private extern class DeviceContextRef extends IUnknownRef
{
    @:native('Draw')
    function draw(_vertexCount : Int, _startVertexLocation : Int) : Void;

    @:native('DrawIndexed')
    function drawIndexed(_indexCount : Int, _startIndexLocation : Int, _baseVertexLocation : Int) : Void;

    @:native('IASetInputLayout')
    function iaSetInputLayout(_layout : InputLayout) : Void;

    @:native('IASetPrimitiveTopology')
    function iaSetPrimitiveTopology(_topology : D3D_PRIMITIVE_TOPOLOGY) : Void;

    inline function iaSetVertexBuffer(_startSlot : Int, _vertexBuffer : Buffer, _stride : Int, _offset : Int) : Void
    {
        untyped __cpp__('{0}->IASetVertexBuffers({1}, 1, (ID3D11Buffer**)&{2}, (UINT*)&{3}, (UINT*)&{4})', this, _startSlot, _vertexBuffer, _stride, _offset);
    }

    @:native('IASetIndexBuffer')
    function iaSetIndexBuffer(_indexBuffer : Buffer, _format : DXGI_FORMAT, _offset : Int) : Void;

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

    inline function psSetConstantBuffer(_startSlot : Int, _constantBuffer : Buffer) : Void
    {
        untyped __cpp__('{0}->PSSetConstantBuffers({1}, 1, (ID3D11Buffer**)&{2})', this, _startSlot, _constantBuffer);
    }

    @:native('VSSetShader')
    function vsSetShader(_shader : VertexShader, _classInstances : Star<ClassInstance>, _numInstances : Int) : Void;

    @:native('PSSetShader')
    function psSetShader(_shader : PixelShader, _classInstances : Star<ClassInstance>, _numInstances : Int) : Void;

    inline function psSetShaderResource(_slot : Int, _resouce : ShaderResourceView) : Void
    {
        untyped __cpp__('{0}->PSSetShaderResources({1}, 1, (ID3D11ShaderResourceView**)&{2})', this, _slot, _resouce);
    }

    inline function clearRenderTargetView(_viewport : RenderTargetView, _color : Array<cpp.Float32>) : Void
    {
        untyped __cpp__('{0}->ClearRenderTargetView((ID3D11RenderTargetView*){1}, (FLOAT*){2})', this, _viewport, cpp.Pointer.ofArray(_color));
    }

    @:native('Map')
    function map(_resource : Buffer, _subresource : Int, _mapType : D3D11_MAP, _mapFlag : Int, _mappedResource : Star<MappedSubResource>) : Int;

    @:native('Unmap')
    function unmap(_resource : Buffer, _subresource : Int) : Void;

    @:native('RSSetState')
    function rsSetState(_state : RasterizerState) : Void;

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
