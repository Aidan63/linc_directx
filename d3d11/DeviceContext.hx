package d3d11;

import d3dcommon.D3DCommon;
import d3d11.D3D11;
import d3d11.resources.*;
import dxgi.DXGI;
import com.IUnknown;
import cpp.Star;
import cpp.Pointer;
import cpp.Reference;

typedef DeviceContext = Star<DeviceContextRef>;

@:unreflective
@:structAccess
@:native("ID3D11DeviceContext")
@:include("d3d11.h")
private extern class DeviceContextRef extends IUnknownRef
{
    @:native('ClearRenderTargetView')
    private function clearRenderTargetViewNative(_viewport : RenderTargetView, _colors : Star<cpp.Float32>) : Void;
    inline  function clearRenderTargetView(_viewport : RenderTargetView, _color : Array<cpp.Float32>) : Void
    {
        clearRenderTargetViewNative(_viewport, cast Pointer.arrayElem(_color, 0));
    }

    @:native('Draw')
    function draw(_vertexCount : Int, _startVertexLocation : Int) : Void;

    @:native('DrawIndexed')
    function drawIndexed(_indexCount : Int, _startIndexLocation : Int, _baseVertexLocation : Int) : Void;

    @:native('Map')
    function map(_resource : Buffer, _subresource : Int, _mapType : D3D11_MAP, _mapFlag : Int, _mappedResource : Star<MappedSubResource>) : Int;

    @:native('Unmap')
    function unmap(_resource : Buffer, _subresource : Int) : Void;

    @:native('IASetInputLayout')
    function iaSetInputLayout(_layout : InputLayout) : Void;

    @:native('IASetPrimitiveTopology')
    function iaSetPrimitiveTopology(_topology : D3D_PRIMITIVE_TOPOLOGY) : Void;

    @:native('IASetIndexBuffer')
    function iaSetIndexBuffer(_indexBuffer : Buffer, _format : DXGI_FORMAT, _offset : Int) : Void;

    @:native('IASetVertexBuffers')
    private function iaSetVertexBuffersNative(_startSlot : Int, _numBuffers : Int, _buffers : Star<Buffer>, _strides : Star<cpp.UInt32>, _offsets : Star<cpp.UInt32>) : Void;
    inline  function iaSetVertexBuffers(_startSlot : Int, _vertexBuffers : Array<Reference<Buffer>>, _strides : Array<cpp.UInt32>, _offsets : Array<cpp.UInt32>) : Void
    {
        var el : Buffer = _vertexBuffers[0];
        iaSetVertexBuffersNative(_startSlot, _vertexBuffers.length, cast Pointer.addressOf(el), cast Pointer.arrayElem(_strides, 0), cast Pointer.arrayElem(_offsets, 0));
    }

    @:native('OMSetRenderTargets')
    private function omSetRenderTargetsNative(_numViews : Int, _renderTargetViews : Star<RenderTargetView>, _depthStencilView : DepthStencilView) : Void;
    inline  function omSetRenderTargets(_renderTargetViews : Array<Reference<RenderTargetView>>, _depthStencilView : DepthStencilView) : Void
    {
        var el : RenderTargetView = _renderTargetViews[0];
        omSetRenderTargetsNative(_renderTargetViews.length, cast Pointer.addressOf(el), _depthStencilView);
    }

    @:native('RSSetViewports')
    private function rsSetViewportsNative(_num : Int, _viewports : Star<Viewport>) : Void;
    inline  function rsSetViewports(_viewports : Array<Reference<Viewport>>) : Void
    {
        var el : Viewport = _viewports[0];
        rsSetViewportsNative(_viewports.length, cast Pointer.addressOf(el));
    }

    @:native('VSSetConstantBuffers')
    private function vsSetConstantBuffersNative(_startSlot : Int, _num : Int, _buffers : Star<Buffer>) : Void;
    inline  function vsSetConstantBuffers(_startSlot : Int, _buffers : Array<Reference<Buffer>>) : Void
    {
        var el : Buffer = _buffers[0];
        vsSetConstantBuffersNative(_startSlot, _buffers.length, cast Pointer.addressOf(el));
    }

    @:native('PSSetConstantBuffers')
    private function psSetConstantBuffersNative(_startSlot : Int, _num : Int, _buffers : Star<Buffer>) : Void;
    inline  function psSetConstantBuffers(_startSlot : Int, _buffers : Array<Reference<Buffer>>) : Void
    {
        var el : Buffer = _buffers[0];
        psSetConstantBuffersNative(_startSlot, _buffers.length, cast Pointer.addressOf(el));
    }

    @:native('VSSetShader')
    function vsSetShader(_shader : VertexShader, _classInstances : Star<ClassInstance>, _numInstances : Int) : Void;

    @:native('PSSetShader')
    function psSetShader(_shader : PixelShader, _classInstances : Star<ClassInstance>, _numInstances : Int) : Void;

    @:native('PSSetShaderResources')
    private function psSetShaderResourcesNative(_startSlot : Int, _num : Int, _shaderResourceViews : Star<ShaderResourceView>) : Void;
    inline  function psSetShaderResources(_startSlot : Int, _shaderResourceViews : Array<Reference<ShaderResourceView>>) : Void
    {
        var el : ShaderResourceView = _shaderResourceViews[0];
        psSetShaderResourcesNative(_startSlot, _shaderResourceViews.length, cast Pointer.addressOf(el));
    }

    @:native('RSSetState')
    function rsSetState(_state : RasterizerState) : Void;

    @:native('OMSetBlendState')
    private function omSetBlendStateNative(_blendState : BlendState, _blendFactor : Star<cpp.Float32>, _sampleMask : Int) : Void;
    inline  function omSetBlendState(_blendState : BlendState, _blendFactor : Array<cpp.Float32>, _sampleMask : Int) : Void
    {
        omSetBlendStateNative(_blendState, cast Pointer.arrayElem(_blendFactor, 0), _sampleMask);
    }

    @:native('RSSetScissorRects')
    private function rsSetScissorRectsNative(_num : Int, _rects : Star<Rect>) : Void;
    inline  function rsSetScissorRects(_rects : Array<Reference<Rect>>) : Void
    {
        var el : Rect = _rects[0];
        rsSetScissorRectsNative(_rects.length, cast Pointer.addressOf(el));
    }

    @:native('PSSetSamplers')
    private function psSetSamplersNative(_startSlot : Int, _num : Int, _samplers : Star<SamplerState>) : Void;
    inline  function psSetSamplers(_startSlot : Int, _samplers : Array<Reference<SamplerState>>) : Void
    {
        var el : SamplerState = _samplers[0];
        psSetSamplersNative(_startSlot, _samplers.length, cast Pointer.addressOf(el));
    }

    @:native('OMSetDepthStencilState')
    function omSetDepthStencilState(_state : DepthStencilState, _stencilRef : Int) : Void;
}
