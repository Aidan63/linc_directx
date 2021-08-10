package d3d11.interfaces;

import haxe.io.BytesData;
import cpp.utils.VarPointer;
import cpp.RawPointer;
import cpp.Pointer;
import cpp.Star;
import cpp.Float32;
import com.GUID;
import com.Unknown;
import d3d11.constants.D3d11Error;
import d3d11.interfaces.D3d11ShaderResourceView.NativeID3D11ShaderResourceView;
import d3d11.interfaces.D3d11SamplerState.NativeID3D11SamplerState;
import d3d11.interfaces.D3d11PixelShader.NativeID3D11PixelShader;
import d3d11.interfaces.D3d11VertexShader.NativeID3D11VertexShader;
import d3d11.interfaces.D3d11ClassInstance.NativeID3D11ClassInstance;
import d3d11.interfaces.D3d11RasterizerState.NativeID3D11RasterizerState;
import d3d11.interfaces.D3d11Buffer;
import d3d11.interfaces.D3d11InputLayout;
import d3d11.interfaces.D3d11BlendState;
import d3d11.interfaces.D3d11DepthStencilState;
import d3d11.interfaces.D3d11DepthStencilView;
import d3d11.interfaces.D3d11RenderTargetView;
import d3d11.interfaces.D3d11Resourse;
import d3d11.structures.D3d11Box;
import d3d11.structures.D3d11Rect;
import d3d11.structures.D3d11Viewport;
import d3d11.structures.D3d11MappedSubResource;
import d3d11.enumerations.D3d11Map;
import d3d11.enumerations.D3d11PrimitiveTopology;
import dxgi.enumerations.DxgiFormat;

using cpp.Native;

class D3d11DeviceContext extends Unknown
{
    final clearColour : Array<Float32>;

    final vectorRenderTargetView : RenderTargetViewVector;

    final vectorBuffer : BufferVector;

    final vectorClassInstance : ClassInstanceVector;

    final vectorSamplerState : SamplerStateVector;

    final vectorShaderResourceView : ShaderResourceViewVector;

    final vectorViewport : ViewportVector;

    final vectorRect : RectVector;

    public function new()
    {
        super();

        clearColour              = [ 0, 0, 0, 0 ];
        vectorRenderTargetView   = new RenderTargetViewVector(32);
        vectorBuffer             = new BufferVector(32);
        vectorClassInstance      = new ClassInstanceVector(32);
        vectorSamplerState       = new SamplerStateVector(32);
        vectorShaderResourceView = new ShaderResourceViewVector(32);
        vectorViewport           = new ViewportVector(32);
        vectorRect               = new RectVector(32);
    }

    /**
     * Gets a pointer to the data contained in a subresource, and denies the GPU access to that subresource.
     * @param _resource A pointer to a `ID3D11Resource` interface.
     * @param _subresource Index number of the subresource.
     * @param _mapType A `D3D11_MAP`-typed value that specifies the CPU's read and write permissions for a resource.
     * @param _mapFlags Flag that specifies what the CPU does when the GPU is busy. This flag is optional.
     * @param _mappedResource A pointer to the `D3D11_MAPPED_SUBRESOURCE` structure for the mapped subresource. See the Remarks section regarding NULL pointers.
     * @return D3d11Error
     */
    public function map(_resource : D3d11Resource, _subresource : Int, _mapType : D3d11Map, _mapFlags : Int, _mappedResource : D3d11MappedSubResource) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11DeviceContext>).map(cast _resource.ptr, _subresource, cast _mapType, _mapFlags, _mappedResource.backing);
    }

    /**
     * Invalidate the pointer to a resource and reenable the GPU's access to that resource.
     * @param _resource A pointer to a `ID3D11Resource` interface.
     * @param _subresource A subresource to be unmapped.
     */
    public function unmap(_resource : D3d11Resource, _subresource : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).unmap(cast _resource.ptr, _subresource);
    }

    /**
     * The CPU copies data from memory to a subresource created in non-mappable memory.
     * @param _resource A pointer to the destination resource (see ID3D11Resource).
     * @param _dstSubresource A zero-based index, that identifies the destination subresource. See D3D11CalcSubresource for more details.
     * @param _box A pointer to a box that defines the portion of the destination subresource to copy the resource data into.
     * Coordinates are in bytes for buffers and in texels for textures.
     * If NULL, the data is written to the destination subresource with no offset. The dimensions of the source must fit the destination (see D3D11_BOX).
     * An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value,
     * or the front value is greater than or equal to the back value. When the box is empty, UpdateSubresource doesn't perform an update operation.
     * @param _srcData A pointer to the source data in memory.
     * @param _srcRowPitch The size of one row of the source data.
     * @param _srcDepthPitch The size of one depth slice of source data.
     */
    public function updateSubresource(_resource : D3d11Resource, _dstSubresource : Int, _box : Null<D3d11Box>, _srcData : BytesData, _srcRowPitch : Int, _srcDepthPitch : Int)
    {
        final buffer = (Pointer.arrayElem(_srcData, 0).reinterpret() : Pointer<cpp.Void>).ptr;

        (cast ptr : Star<NativeID3D11DeviceContext>).updateSubresource(cast _resource.ptr, _dstSubresource, if (_box == null) null else cast _box.backing, buffer, _srcRowPitch, _srcDepthPitch);
    }

    /**
     * Set all the elements in a render target to one value.
     * @param _view Pointer to the render target.
     * @param _color A 4-component array that represents the color to fill the render target with.
     */
    public function clearRenderTargetView(_view : D3d11RenderTargetView, _color : Array<Float>)
    {
        for (i in 0..._color.length)
        {
            clearColour[i] = _color[i];
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).clearRenderTargetView(cast _view.ptr, cast Pointer.arrayElem(clearColour, 0).ptr);
    }

    /**
     * Clears the depth-stencil resource.
     * @param _view Pointer to the depth stencil to be cleared.
     * @param _clearFlags Identify the type of data to clear (see `D3D11_CLEAR_FLAG`).
     * @param _depth Clear the depth buffer with this value. This value will be clamped between 0 and 1.
     * @param _stencil Clear the stencil buffer with this value.
     */
    public function clearDepthStencilView(_view : D3d11DepthStencilView, _clearFlags : Int, _depth : Float, _stencil : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).clearDepthStencilView(cast _view.ptr, _clearFlags, _depth, _stencil);
    }

    /**
     * Draw non-indexed, non-instanced primitives.
     * @param _vertexCount Number of vertices to draw.
     * @param _startIndexLocation Index of the first vertex, which is usually an offset in a vertex buffer.
     */
    public function draw(_vertexCount : Int, _startIndexLocation : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).draw(_vertexCount, _startIndexLocation);
    }

    /**
     * Draw indexed, non-instanced primitives.
     * @param _indexCount Number of indices to draw.
     * @param _startIndexLocation The location of the first index read by the GPU from the index buffer.
     * @param _baseVertexLocation A value added to each index before reading a vertex from the vertex buffer.
     */
    public function drawIndexed(_indexCount : Int, _startIndexLocation : Int, _baseVertexLocation : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).drawIndexed(_indexCount, _startIndexLocation, _baseVertexLocation);
    }

    /**
     * Bind one or more render targets atomically and the depth-stencil buffer to the output-merger stage.
     * @param _renderTargetViews Pointer to an array of `ID3D11RenderTargetView` that represent the render targets to bind to the device. If this parameter is NULL and NumViews is 0, no render targets are bound.
     * @param _depthStencilView Pointer to a `ID3D11DepthStencilView` that represents the depth-stencil view to bind to the device. If this parameter is NULL, the depth-stencil state is not bound.
     */
    public function omSetRenderTargets(_renderTargetViews : Null<Array<D3d11RenderTargetView>>, _depthStencilView : Null<D3d11DepthStencilView>)
    {
        if (_renderTargetViews != null)
        {
            for (i in 0..._renderTargetViews.length)
            {
                vectorRenderTargetView[i] = cast _renderTargetViews[i].ptr;
            }

            (cast ptr : Star<NativeID3D11DeviceContext>).omSetRenderTargets(_renderTargetViews.length, vectorRenderTargetView.data(), _depthStencilView == null ? null : cast _depthStencilView.ptr);
        }
        else
        {
            final nullptr : Star<NativeID3D11RenderTargetView> = null;

            (cast ptr : Star<NativeID3D11DeviceContext>).omSetRenderTargets(0, cpp.Native.addressOf(nullptr), _depthStencilView == null ? null : cast _depthStencilView.ptr);
        }
    }

    /**
     * Bind a render target atomically and the depth-stencil buffer to the output-merger stage.
     * @param _renderTargetViews Pointer to a `ID3D11RenderTargetView` that represent the render targets to bind to the device. If this parameter is NULL and NumViews is 0, no render targets are bound.
     * @param _depthStencilView Pointer to a `ID3D11DepthStencilView` that represents the depth-stencil view to bind to the device. If this parameter is NULL, the depth-stencil state is not bound.
     */
    public function omSetRenderTarget(_renderTargetView : Null<D3d11RenderTargetView>, _depthStencilView : Null<D3d11DepthStencilView>)
    {
        if (_renderTargetView != null)
        {
            vectorRenderTargetView[0] = cast _renderTargetView.ptr;

            (cast ptr : Star<NativeID3D11DeviceContext>).omSetRenderTargets(1, vectorRenderTargetView.data(), _depthStencilView == null ? null : cast _depthStencilView.ptr);
        }
        else
        {
            final nullptr : Star<NativeID3D11RenderTargetView> = null;

            (cast ptr : Star<NativeID3D11DeviceContext>).omSetRenderTargets(0, cpp.Native.addressOf(nullptr), _depthStencilView == null ? null : cast _depthStencilView.ptr);
        }
    }

    /**
     * Sets the depth-stencil state of the output-merger stage.
     * @param _depthStencilState Pointer to a depth-stencil state interface (see `ID3D11DepthStencilState`) to bind to the device. Set this to NULL to use the default state listed in `D3D11_DEPTH_STENCIL_DESC`.
     * @param _stencilRef Reference value to perform against when doing a depth-stencil test. See remarks.
     */
    public function omSetDepthStencilState(_depthStencilState : Null<D3d11DepthStencilState>, _stencilRef : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).omSetDepthStencilState(_depthStencilState == null ? null : cast _depthStencilState.ptr, _stencilRef);
    }

    /**
     * Set the blend state of the output-merger stage.
     * @param _blendState Pointer to a blend-state interface (see `ID3D11BlendState`). Pass NULL for a default blend state. For more info about default blend state, see Remarks.
     * @param _blendFactor Array of blend factors, one for each RGBA component.
     * The blend factors modulate values for the pixel shader, render target, or both.
     * If you created the blend-state object with `D3D11_BLEND_BLEND_FACTOR` or `D3D11_BLEND_INV_BLEND_FACTOR`, the blending stage uses the non-NULL array of blend factors.
     * If you didn't create the blend-state object with `D3D11_BLEND_BLEND_FACTOR` or `D3D11_BLEND_INV_BLEND_FACTOR`, the blending stage does not use the non-NULL array of blend factors; the runtime stores the blend factors, and you can later call `ID3D11DeviceContext::OMGetBlendState` to retrieve the blend factors.
     * If you pass NULL, the runtime uses or stores a blend factor equal to { 1, 1, 1, 1 }.
     * @param _sampleMask 32-bit sample coverage. The default value is 0xffffffff. See remarks.
     */
    public function omSetBlendState(_blendState : Null<D3d11BlendState>, _blendFactor : Null<Array<Float>>, _sampleMask : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).omSetBlendState(_blendState == null ? null : cast _blendState.ptr, _blendFactor == null ? null : cast Pointer.arrayElem(_blendFactor, 0).ptr, _sampleMask);
    }

    /**
     * Bind information about the primitive type, and data order that describes input data for the input assembler stage.
     * @param _topology The type of primitive and ordering of the primitive data (see `D3D11_PRIMITIVE_TOPOLOGY`).
     */
    public function iaSetPrimitiveTopology(_topology : D3d11PrimitiveTopology)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).iaSetPrimitiveTopology(cast _topology);
    }

    /**
     * Bind an input-layout object to the input-assembler stage.
     * @param _inputLayout A pointer to the input-layout object (see `ID3D11InputLayout`), which describes the input buffers that will be read by the IA stage.
     */
    public function iaSetInputLayout(_inputLayout : D3d11InputLayout)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).iaSetInputLayout(cast _inputLayout.ptr);
    }

    /**
     * Bind an index buffer to the input-assembler stage.
     * @param _buffer A pointer to an `ID3D11Buffer` object, that contains indices. The index buffer must have been created with the `D3D11_BIND_INDEX_BUFFER` flag.
     * @param _format A DXGI_FORMAT that specifies the format of the data in the index buffer. The only formats allowed for index buffer data are 16-bit (`DXGI_FORMAT_R16_UINT`) and 32-bit (`DXGI_FORMAT_R32_UINT`) integers.
     * @param _offset Offset (in bytes) from the start of the index buffer to the first index to use.
     */
    public function iaSetIndexBuffer(_buffer : D3d11Buffer, _format : DxgiFormat, _offset : Int)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).iaSetIndexBuffer(cast _buffer.ptr, cast _format, _offset);
    }

    /**
     * Bind an array of vertex buffers to the input-assembler stage.
     * @param _startSlot The first input slot for binding.
     * The first vertex buffer is explicitly bound to the start slot; this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot.
     * The maximum of 16 or 32 input slots (ranges from 0 to `D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT` - 1) are available; the maximum number of input slots depends on the feature level.
     * @param _buffers A pointer to an array of vertex buffers (see `ID3D11Buffer`). The vertex buffers must have been created with the `D3D11_BIND_VERTEX_BUFFER` flag.
     * @param _strides Pointer to an array of stride values; one stride value for each buffer in the vertex-buffer array. Each stride is the size (in bytes) of the elements that are to be used from that vertex buffer.
     * @param _offsets Pointer to an array of offset values; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
     */
    public function iaSetVertexBuffers(_startSlot : Int, _buffers : Array<D3d11Buffer>, _strides : Array<Int>, _offsets : Array<Int>)
    {
        for (i in 0..._buffers.length)
        {
            vectorBuffer[i] = cast _buffers[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).iaSetVertexBuffers(_startSlot, _buffers.length, vectorBuffer.data(), cast Pointer.arrayElem(_strides, 0).ptr, cast Pointer.arrayElem(_offsets, 0).ptr);
    }

    /**
     * Bind a vertex buffer to the input-assembler stage.
     * @param _startSlot The first input slot for binding.
     * The first vertex buffer is explicitly bound to the start slot; this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot.
     * The maximum of 16 or 32 input slots (ranges from 0 to `D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT` - 1) are available; the maximum number of input slots depends on the feature level.
     * @param _buffers A pointer to an array of vertex buffers (see `ID3D11Buffer`). The vertex buffers must have been created with the `D3D11_BIND_VERTEX_BUFFER` flag.
     * @param _strides Pointer to an array of stride values; one stride value for each buffer in the vertex-buffer array. Each stride is the size (in bytes) of the elements that are to be used from that vertex buffer.
     * @param _offsets Pointer to an array of offset values; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
     */
    public function iaSetVertexBuffer(_slot : Int, _buffer : D3d11Buffer, _stride : Int, _offset : Int)
    {
        vectorBuffer[0] = cast _buffer.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext>).iaSetVertexBuffers(_slot, 1, vectorBuffer.data(), cast VarPointer.addressOf(_stride).ptr, cast VarPointer.addressOf(_offset).ptr);
    }

    /**
     * Bind an array of viewports to the rasterizer stage of the pipeline.
     * @param _viewports An array of `D3D11_VIEWPORT` structures to bind to the device. See the structure page for details about how the viewport size is dependent on the device feature level which has changed between Direct3D 11 and Direct3D 10.
     */
    public function rsSetViewports(_viewports : Array<D3d11Viewport>)
    {
        for (i in 0..._viewports.length)
        {
            vectorViewport[i] = _viewports[i].backing;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).rsSetViewports(_viewports.length, vectorViewport.data());
    }

    /**
     * Bind a viewport to the rasterizer stage of the pipeline.
     * @param _viewports `D3D11_VIEWPORT` structure to bind to the device. See the structure page for details about how the viewport size is dependent on the device feature level which has changed between Direct3D 11 and Direct3D 10.
     */
    public function rsSetViewport(_viewport : D3d11Viewport)
    {
        vectorViewport[0] = _viewport.backing;

        (cast ptr : Star<NativeID3D11DeviceContext>).rsSetViewports(1, vectorViewport.data());
    }

    /**
     * Bind an array of scissor rectangles to the rasterizer stage.
     * @param _rects An array of scissor rectangles (see `D3D11_RECT`).
     */
    public function rsSetScissorRects(_rects : Array<D3d11Rect>)
    {
        for (i in 0..._rects.length)
        {
            vectorRect[i] = _rects[i].backing;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).rsSetScissorRects(_rects.length, vectorRect.data());
    }

    /**
     * Bind a scissor rectangle to the rasterizer stage.
     * @param _rects Scissor rectangles (see `D3D11_RECT`).
     */
    public function rsSetScissorRect(_rect : D3d11Rect)
    {
        vectorRect[0] = _rect.backing;

        (cast ptr : Star<NativeID3D11DeviceContext>).rsSetScissorRects(1, vectorRect.data());
    }

    /**
     * Set the rasterizer state for the rasterizer stage of the pipeline.
     * @param _state Pointer to a rasterizer-state interface (see `ID3D11RasterizerState`) to bind to the pipeline.
     */
    public function rsSetState(_state : D3d11RasterizerState)
    {
        (cast ptr : Star<NativeID3D11DeviceContext>).rsSetState(cast _state.ptr);
    }

    /**
     * Set a vertex shader to the device.
     * @param _vertexShader Pointer to a vertex shader (see `ID3D11VertexShader`). Passing in NULL disables the shader for this pipeline stage.
     * @param _classInstances A pointer to an array of class-instance interfaces (see `ID3D11ClassInstance`). Each interface used by a shader must have a corresponding class instance or the shader will get disabled.
     * Set ppClassInstances to NULL if the shader does not use any interfaces.
     */
    public function vsSetShader(_vertexShader : D3d11VertexShader, _classInstances : Null<Array<D3d11ClassInstance>>)
    {
        if (_classInstances != null)
        {
            for (i in 0..._classInstances.length)
            {
                vectorClassInstance[i] = cast _classInstances[i].ptr;
            }

            (cast ptr : Star<NativeID3D11DeviceContext>).vsSetShader(cast _vertexShader.ptr, vectorClassInstance.data(), _classInstances.length);
        }
        else
        {
            var nullptr : Star<NativeID3D11ClassInstance> = null;

            (cast ptr : Star<NativeID3D11DeviceContext>).vsSetShader(cast _vertexShader.ptr, cpp.Native.addressOf(nullptr), 0);
        }
    }

    /**
     * Sets the constant buffers used by the vertex shader pipeline stage.
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffers Array of constant buffers (see `ID3D11Buffer`) being given to the device.
     */
    public function vsSetConstantBuffers(_startSlot : Int, _buffers : Array<D3d11Buffer>)
    {
        for (i in 0..._buffers.length)
        {
            vectorBuffer[i] = cast _buffers[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).vsSetConstantBuffers(_startSlot, _buffers.length, vectorBuffer.data());
    }

    /**
     * Sets the constant buffer used by the vertex shader pipeline stage.
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffer Constant buffer (see `ID3D11Buffer`) being given to the device.
     */
    public function vsSetConstantBuffer(_slot : Int, _buffer : D3d11Buffer)
    {
        vectorBuffer[0] = cast _buffer.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext>).vsSetConstantBuffers(_slot, 1, vectorBuffer.data());
    }

    /**
     * Sets a pixel shader to the device.
     * @param _pixelShader Pointer to a pixel shader (see ID3D11PixelShader). Passing in NULL disables the shader for this pipeline stage.
     * @param _classInstances A pointer to an array of class-instance interfaces (see `ID3D11ClassInstance`).
     * Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to NULL if the shader does not use any interfaces.
     */
    public function psSetShader(_pixelShader : D3d11PixelShader, _classInstances : Null<Array<D3d11ClassInstance>>)
    {
        if (_classInstances != null)
        {
            for (i in 0..._classInstances.length)
            {
                vectorClassInstance[i] = cast _classInstances[i].ptr;
            }

            (cast ptr : Star<NativeID3D11DeviceContext>).psSetShader(cast _pixelShader.ptr, vectorClassInstance.data(), _classInstances.length);
        }
        else
        {
            var nullptr : Star<NativeID3D11ClassInstance> = null;

            (cast ptr : Star<NativeID3D11DeviceContext>).psSetShader(cast _pixelShader.ptr, cpp.Native.addressOf(nullptr), 0);
        }
    }

    /**
     * Sets the constant buffers used by the pixel shader pipeline stage.
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffers Array of constant buffers (see `ID3D11Buffer`) being given to the device.
     */
    public function psSetConstantBuffers(_startSlot : Int, _buffers : Array<D3d11Buffer>)
    {
        for (i in 0..._buffers.length)
        {
            vectorBuffer[i] = cast _buffers[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).psSetConstantBuffers(_startSlot, _buffers.length, vectorBuffer.data());
    }

    /**
     * Sets the constant buffers used by the pixel shader pipeline stage.
     * @param _slot Index into the device's zero-based array to set the constant buffer to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffer constant buffer (see `ID3D11Buffer`) being given to the device.
     */
    public function psSetConstantBuffer(_slot : Int, _buffer : D3d11Buffer)
    {
        vectorBuffer[0] = cast _buffer.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext>).psSetConstantBuffers(_slot, 1, vectorBuffer.data());
    }

    /**
     * Set an array of sampler states to the pixel shader pipeline stage.
     * @param _startSlot Index into the device's zero-based array to begin setting samplers to (ranges from 0 to `D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT` - 1).
     * @param _samplers Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to `D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT` - StartSlot).
     */
    public function psSetSamplers(_startSlot : Int, _samplers : Array<D3d11SamplerState>)
    {
        for (i in 0..._samplers.length)
        {
            vectorSamplerState[i] = cast _samplers[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).psSetSamplers(_startSlot, _samplers.length, vectorSamplerState.data());
    }

    /**
     * Set a sampler states to the pixel shader pipeline stage.
     * @param _startSlot Index into the device's zero-based array to set the sampler to (ranges from 0 to `D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT` - 1).
     * @param _samplers Sampler object.
     */
    public function psSetSampler(_slot : Int, _sampler : D3d11SamplerState)
    {
        vectorSamplerState[0] = cast _sampler.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext>).psSetSamplers(_slot, 1, vectorSamplerState.data());
    }

    /**
     * Bind an array of shader resources to the pixel shader stage.
     * @param _startSlot Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to `D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT` - 1).
     * @param _shaderResourceViews Array of shader resource view interfaces to set to the device.
     */
    public function psSetShaderResources(_startSlot : Int, _shaderResourceViews : Array<D3d11ShaderResourceView>)
    {
        for (i in 0..._shaderResourceViews.length)
        {
            vectorShaderResourceView[i] = cast _shaderResourceViews[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext>).psSetShaderResources(_startSlot, _shaderResourceViews.length, vectorShaderResourceView.data());
    }

    /**
     * Bind an array of shader resources to the pixel shader stage.
     * @param _startSlot Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to `D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT` - 1).
     * @param _shaderResourceViews Array of shader resource view interfaces to set to the device.
     */
    public function psSetShaderResource(_slot : Int, _shaderResourceView : D3d11ShaderResourceView)
    {
        vectorShaderResourceView[0] = cast _shaderResourceView.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext>).psSetShaderResources(_slot, 1, vectorShaderResourceView.data());
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11DeviceContext')
extern class NativeID3D11DeviceContext extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11DeviceContext)');
    }

    @:native('Map')
    function map(_resource : Star<NativeID3D11Resource>, _subresource : cpp.UInt32, _mapType : NativeD3D11Map, _mapFlags : cpp.UInt32, _mappedSubresource : Star<NativeD3D11MappedSubResource>) : Int;

    @:native('Unmap')
    function unmap(_resource : Star<NativeID3D11Resource>, _subresource : cpp.UInt32) : Void;

    @:native('UpdateSubresource')
    function updateSubresource(_resource : Star<NativeID3D11Resource>, _dstSubresource : cpp.UInt32, _dstBox : Star<NativeD3D11Box>, _srcData : Star<cpp.Void>, _srcRowPitch : cpp.UInt32, _srcDepthPitch : cpp.UInt32) : Void;

    @:native('ClearRenderTargetView')
    function clearRenderTargetView(_view : Star<NativeID3D11RenderTargetView>, _color : Star<cpp.Float32>) : Void;

    @:native('ClearDepthStencilView')
    function clearDepthStencilView(_view : Star<NativeID3D11DepthStencilView>, _clearFlags : cpp.UInt32, _depth : cpp.Float32, _stencil : cpp.UInt32) : Void;

    @:native('Draw')
    function draw(_vertexCount : cpp.UInt32, _startVertexLocation : cpp.UInt32) : Void;

    @:native('DrawIndexed')
    function drawIndexed(_indexCount : cpp.UInt32, _startIndexLocation : cpp.UInt32, _baseVertexLocation : Int) : Void;

    @:native('OMSetRenderTargets')
    function omSetRenderTargets(_numViews : Int, _renderTargetViews : Star<Star<NativeID3D11RenderTargetView>>, _depthStencilView : Star<NativeID3D11DepthStencilView>) : Void;

    @:native('OMSetDepthStencilState')
    function omSetDepthStencilState(_depthStencilState : Star<NativeID3D11DepthStencilState>, _stencilRef : cpp.UInt32) : Void;

    @:native('OMSetBlendState')
    function omSetBlendState(_blendState : Star<NativeID3D11BlendState>, _blendFactor : Star<cpp.Float32>, _sampleMask : cpp.UInt32) : Void;

    @:native('IASetPrimitiveTopology')
    function iaSetPrimitiveTopology(_topology : NativeD3D11PrimitiveTopology) : Void;

    @:native('IASetInputLayout')
    function iaSetInputLayout(_inputLayout : Star<NativeID3D11InputLayout>) : Void;

    @:native('IASetIndexBuffer')
    function iaSetIndexBuffer(_indexBuffer : Star<NativeID3D11Buffer>, _format : NativeDXGIFormat, _offset : cpp.UInt32) : Void;

    @:native('IASetVertexBuffers')
    function iaSetVertexBuffers(_startSlot : cpp.UInt32, _numBuffers : cpp.UInt32, _vertexBuffers : Star<Star<NativeID3D11Buffer>>, _strides : Star<cpp.UInt32>, _offsets : Star<cpp.UInt32>) : Void;

    @:native('RSSetViewports')
    function rsSetViewports(_numViewports : cpp.UInt32, _viewports : Star<NativeD3D11Viewport>) : Void;

    @:native('RSSetScissorRects')
    function rsSetScissorRects(_numRects : cpp.UInt32, _rects : Star<NativeD3D11Rect>) : Void;

    @:native('RSSetState')
    function rsSetState(_state : Star<NativeID3D11RasterizerState>) : Void;

    @:native('VSSetShader')
    function vsSetShader(_vertexShader : Star<NativeID3D11VertexShader>, _classInstances : Star<Star<NativeID3D11ClassInstance>>, _numClassInstances : cpp.UInt32) : Void;

    @:native('VSSetConstantBuffers')
    function vsSetConstantBuffers(_startSlot : cpp.UInt32, _numBuffers : cpp.UInt32, _constantBuffers : Star<Star<NativeID3D11Buffer>>) : Void;

    @:native('PSSetShader')
    function psSetShader(_vertexShader : Star<NativeID3D11PixelShader>, _classInstances : Star<Star<NativeID3D11ClassInstance>>, _numClassInstances : cpp.UInt32) : Void;

    @:native('PSSetConstantBuffers')
    function psSetConstantBuffers(_startSlot : cpp.UInt32, _numBuffers : cpp.UInt32, _constantBuffers : Star<Star<NativeID3D11Buffer>>) : Void;

    @:native('PSSetSamplers')
    function psSetSamplers(_startSlot : cpp.UInt32, _numSamplers : cpp.UInt32, _samplers : Star<Star<NativeID3D11SamplerState>>) : Void;

    @:native('PSSetShaderResources')
    function psSetShaderResources(_startSlot : cpp.UInt32, _numViews : cpp.UInt32, _shaderResourceViews : Star<Star<NativeID3D11ShaderResourceView>>) : Void;
}

class D3d11DeviceContext1 extends D3d11DeviceContext
{
    public static final uuid : cpp.Struct<GUID> = NativeID3D11DeviceContext1.uuid();
    
    /**
     * Sets the constant buffers that the pixel shader pipeline stage uses, and enables the shader to access other parts of the buffer.
     * 
     * https://docs.microsoft.com/en-us/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-pssetconstantbuffers1
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffers Array of constant buffers being given to the device.
     * @param _constants An array that holds the offsets into the buffers that `_buffers` specifies.
     * Each offset specifies where, from the shader's point of view, each constant buffer starts.
     * Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).
     * Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer.
     * Each offset must be a multiple of 16 constants.
     */
    public function psSetConstantBuffers1(_startSlot : Int, _buffers : Array<D3d11Buffer>, _offsets : Array<Int>, _lengths : Array<Int>)
    {
        for (i in 0..._buffers.length)
        {
            vectorBuffer[i] = cast _buffers[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext1>).psSetConstantBuffers1(_startSlot, _buffers.length, vectorBuffer.data(), cast Pointer.arrayElem(_offsets, 0).ptr, cast Pointer.arrayElem(_lengths, 0).ptr);
    }

    /**
     * Sets a constant buffer that the pixel shader pipeline stage uses, and enables the shader to access other parts of the buffer.
     * 
     * https://docs.microsoft.com/en-us/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-pssetconstantbuffers1
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffers Array of constant buffers being given to the device.
     * @param _constants An array that holds the offsets into the buffers that `_buffers` specifies.
     * Each offset specifies where, from the shader's point of view, each constant buffer starts.
     * Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).
     * Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer.
     * Each offset must be a multiple of 16 constants.
     */
    public function psSetConstantBuffer1(_slot : Int, _buffer : D3d11Buffer, _offset : Int, _length : Int)
    {
        vectorBuffer[0] = cast _buffer.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext1>).psSetConstantBuffers1(_slot, 1, vectorBuffer.data(), cast VarPointer.addressOf(_offset).ptr, cast VarPointer.addressOf(_length).ptr);
    }

    /**
     * Sets the constant buffers that the vertex shader pipeline stage uses.
     * 
     * https://docs.microsoft.com/en-us/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-vssetconstantbuffers1
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffers Array of constant buffers being given to the device.
     * @param _constants An array that holds the offsets into the buffers that `_buffers` specifies.
     * Each offset specifies where, from the shader's point of view, each constant buffer starts.
     * Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).
     * Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer.
     * Each offset must be a multiple of 16 constants.
     */
    public function vsSetConstantBuffers1(_startSlot : Int, _buffers : Array<D3d11Buffer>, _offsets : Array<Int>, _lengths : Array<Int>)
    {
        for (i in 0..._buffers.length)
        {
            vectorBuffer[i] = cast _buffers[i].ptr;
        }

        (cast ptr : Star<NativeID3D11DeviceContext1>).vsSetConstantBuffers1(_startSlot, _buffers.length, vectorBuffer.data(), cast Pointer.arrayElem(_offsets, 0).ptr, cast Pointer.arrayElem(_lengths, 0).ptr);
    }

    /**
     * Sets a constant buffer that the vertex shader pipeline stage uses.
     * 
     * https://docs.microsoft.com/en-us/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-vssetconstantbuffers1
     * @param _startSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to `D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT` - 1).
     * @param _buffers Array of constant buffers being given to the device.
     * @param _constants An array that holds the offsets into the buffers that `_buffers` specifies.
     * Each offset specifies where, from the shader's point of view, each constant buffer starts.
     * Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).
     * Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer.
     * Each offset must be a multiple of 16 constants.
     */
    public function vsSetConstantBuffer1(_slot : Int, _buffer : D3d11Buffer, _offset : Int, _length : Int)
    {
        vectorBuffer[0] = cast _buffer.ptr;

        (cast ptr : Star<NativeID3D11DeviceContext1>).vsSetConstantBuffers1(_slot, 1, vectorBuffer.data(), cast VarPointer.addressOf(_offset).ptr, cast VarPointer.addressOf(_length).ptr);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11_1.h')
@:native('ID3D11DeviceContext1')
extern class NativeID3D11DeviceContext1 extends NativeID3D11DeviceContext
{
    static inline function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11DeviceContext1)');
    }

    @:native('PSSetConstantBuffers1')
    function psSetConstantBuffers1(_startSlot : cpp.UInt32, _numBuffers : cpp.UInt32, _constantBuffers : Star<Star<NativeID3D11Buffer>>, _firstConstants : Star<cpp.UInt32>, _numConstants : Star<cpp.UInt32>) : Void;

    @:native('VSSetConstantBuffers1')
    function vsSetConstantBuffers1(_startSlot : cpp.UInt32, _numBuffers : cpp.UInt32, _constantBuffers : Star<Star<NativeID3D11Buffer>>, _firstConstants : Star<cpp.UInt32>, _numConstants : Star<cpp.UInt32>) : Void;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<ID3D11RenderTargetView*>')
private extern class StdVectorRenderTargetViewImpl
{
    @:native('std::vector<ID3D11RenderTargetView*>')
    static function create(_count : Int) : StdVectorRenderTargetViewImpl;

    function data() : Star<Star<NativeID3D11RenderTargetView>>;

    @:native('data')
    private function ptr() : RawPointer<Star<NativeID3D11RenderTargetView>>;
}

@:forward()
private abstract RenderTargetViewVector(StdVectorRenderTargetViewImpl)
{
    public function new(_count : Int)
    {
        this = StdVectorRenderTargetViewImpl.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : Star<NativeID3D11RenderTargetView>
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : Star<NativeID3D11RenderTargetView>) : Star<NativeID3D11RenderTargetView>
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<ID3D11Buffer*>')
private extern class StdVectorBufferImple
{
    @:native('std::vector<ID3D11Buffer*>')
    static function create(_count : Int) : StdVectorBufferImple;

    function data() : Star<Star<NativeID3D11Buffer>>;

    @:native('data')
    private function ptr() : RawPointer<Star<NativeID3D11Buffer>>;
}

@:forward()
private abstract BufferVector(StdVectorBufferImple)
{
    public function new(_count : Int)
    {
        this = StdVectorBufferImple.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : Star<NativeID3D11Buffer>
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : Star<NativeID3D11Buffer>) : Star<NativeID3D11Buffer>
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<ID3D11ClassInstance*>')
private extern class StdVectorClassInstanceImpl
{
    @:native('std::vector<ID3D11ClassInstance*>')
    static function create(_count : Int) : StdVectorClassInstanceImpl;

    function data() : Star<Star<NativeID3D11ClassInstance>>;

    @:native('data')
    private function ptr() : RawPointer<Star<NativeID3D11ClassInstance>>;
}

@:forward()
private abstract ClassInstanceVector(StdVectorClassInstanceImpl)
{
    public function new(_count : Int)
    {
        this = StdVectorClassInstanceImpl.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : Star<NativeID3D11ClassInstance>
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : Star<NativeID3D11ClassInstance>) : Star<NativeID3D11ClassInstance>
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<D3D11_VIEWPORT>')
private extern class StdVectorViewportImpl
{
    @:native('std::vector<D3D11_VIEWPORT>')
    static function create(_count : Int) : StdVectorViewportImpl;

    function data() : Star<NativeD3D11Viewport>;

    @:native('data')
    private function ptr() : RawPointer<NativeD3D11Viewport>;
}

@:forward()
private abstract ViewportVector(StdVectorViewportImpl)
{
    public function new(_count : Int)
    {
        this = StdVectorViewportImpl.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : NativeD3D11Viewport
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : NativeD3D11Viewport) : NativeD3D11Viewport
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<D3D11_RECT>')
private extern class StdVectorRectImpl
{
    @:native('std::vector<D3D11_RECT>')
    static function create(_count : Int) : StdVectorRectImpl;

    function data() : Star<NativeD3D11Rect>;

    @:native('data')
    private function ptr() : RawPointer<NativeD3D11Rect>;
}

@:forward()
private abstract RectVector(StdVectorRectImpl)
{
    public function new(_count : Int)
    {
        this = StdVectorRectImpl.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : NativeD3D11Rect
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : NativeD3D11Rect) : NativeD3D11Rect
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<ID3D11SamplerState*>')
private extern class StdVectorSamplerStateImpl
{
    @:native('std::vector<ID3D11SamplerState*>')
    static function create(_count : Int) : StdVectorSamplerStateImpl;

    function data() : Star<Star<NativeID3D11SamplerState>>;

    @:native('data')
    private function ptr() : RawPointer<Star<NativeID3D11SamplerState>>;
}

@:forward()
private abstract SamplerStateVector(StdVectorSamplerStateImpl)
{
    public function new(_count : Int)
    {
        this = StdVectorSamplerStateImpl.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : Star<NativeID3D11SamplerState>
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : Star<NativeID3D11SamplerState>) : Star<NativeID3D11SamplerState>
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('std::vector<ID3D11ShaderResourceView*>')
private extern class StdVectorShaderResourceViewImpl
{
    @:native('std::vector<ID3D11ShaderResourceView*>')
    static function create(_count : Int) : StdVectorShaderResourceViewImpl;

    function data() : Star<Star<NativeID3D11ShaderResourceView>>;

    @:native('data')
    private function ptr() : RawPointer<Star<NativeID3D11ShaderResourceView>>;
}

@:forward()
private abstract ShaderResourceViewVector(StdVectorShaderResourceViewImpl)
{
    public function new(_count : Int)
    {
        this = StdVectorShaderResourceViewImpl.create(_count);
    }

    @:arrayAccess
    inline function arrayGet(_key : Int) : Star<NativeID3D11ShaderResourceView>
    {
        return @:privateAccess this.ptr()[_key];
    }

    @:arrayAccess
    inline function arraySet(_key : Int, _value : Star<NativeID3D11ShaderResourceView>) : Star<NativeID3D11ShaderResourceView>
    {
        @:privateAccess this.ptr()[_key] = _value;

        return _value;
    }
}
