package;

import haxe.io.Bytes;
import cpp.Pointer;
import sdl.Window;
import sdl.SDL;
import com.HWND;
import d3d11.D3d11;
import d3d11.interfaces.D3d11RenderTargetView;
import d3d11.structures.D3d11MappedSubResource;
import d3d11.interfaces.D3d11DepthStencilView;
import d3d11.interfaces.D3d11Texture2D;
import d3d11.interfaces.D3d11Buffer;
import d3d11.interfaces.D3d11BlendState;
import d3d11.interfaces.D3d11DeviceContext;
import d3d11.interfaces.D3d11Device;
import d3d11.interfaces.D3d11RasterizerState;
import d3d11.structures.D3d11Texture2DDescription;
import d3d11.structures.D3d11SubResourceData;
import d3d11.structures.D3d11BufferDescription;
import d3d11.structures.D3d11RasterizerDescription;
import d3d11.structures.D3d11Rect;
import d3d11.structures.D3d11Viewport;
import d3d11.structures.D3d11BlendDescription;
import d3d11.structures.D3d11DepthStencilViewDescription;
import d3d11.enumerations.D3d11Usage;
import d3d11.enumerations.D3d11CpuAccessFlag;
import d3d11.enumerations.D3d11BindFlag;
import d3d11.enumerations.D3d11ColorWriteEnable;
import dxgi.Dxgi;
import dxgi.interfaces.DxgiAdapter;
import dxgi.interfaces.DxgiFactory;
import dxgi.interfaces.DxgiOutput;
import dxgi.interfaces.DxgiSwapChain;
import dxgi.structures.DxgiSwapChainDescription;

@:headerInclude('SDL_syswm.h')
@:buildXml('<target id = "haxe">
    <lib name = "dxgi.lib"        if = "windows" unless = "static_link" />
    <lib name = "d3d11.lib"       if = "windows" unless = "static_link" />
    <lib name = "d3dcompiler.lib" if = "windows" unless = "static_link" />
</target>')
class Test
{
    static function main()
    {
        new Test();
    }

    final window     : Window;
    final factory    : DxgiFactory;
    final adapter    : DxgiAdapter;
    final output     : DxgiOutput;
    final swapchain  : DxgiSwapChain;
    final device     : D3d11Device;
    final context    : D3d11DeviceContext;
    final rasterize  : D3d11RasterizerState;
    final viewport   : D3d11Viewport;
    final clipRect   : D3d11Rect;
    final blending   : D3d11BlendState;
    final buffer     : D3d11Buffer;
    final depthTex   : D3d11Texture2D;
    final swapTex    : D3d11Texture2D;
    final dsvView    : D3d11DepthStencilView;
    final renderView : D3d11RenderTargetView;

    public function new()
    {
        if (SDL.init(SDL_INIT_VIDEO) != 0)
        {
            throw 'Failed to start SDL';
        }

        window    = SDL.createWindow("linc_directx", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 1280, 720, SDL_WINDOW_SHOWN);
        factory   = new DxgiFactory();
        adapter   = new DxgiAdapter();
        output    = new DxgiOutput();
        swapchain = new DxgiSwapChain();
        device    = new D3d11Device();
        context   = new D3d11DeviceContext();
        rasterize = new D3d11RasterizerState();
        blending  = new D3d11BlendState();
        buffer    = new D3d11Buffer();
        depthTex  = new D3d11Texture2D();
        dsvView   = new D3d11DepthStencilView();

        // Get SDL variables

        var success     = false;
        var adapterIdx  = 0;
        var outputIdx   = 0;
        var hwnd : HWND = null;

        untyped __cpp__('SDL_SysWMinfo info;
        SDL_VERSION(&info.version);
        SDL_GetWindowWMInfo({1}, &info);
        {0} = SDL_DXGIGetOutputInfo(SDL_GetWindowDisplayIndex({1}), &{2}, &{3});
        {4} = info.info.win.window', success, window, adapterIdx, outputIdx, hwnd);

        if (!success)
        {
            throw 'Unable to get DXGI information for the window';
        }

        // Setup DXGI

        if (Dxgi.createFactory(factory) != Ok)
        {
            throw 'Failed to Create DXGI Factory';
        }
        if (factory.enumAdapters(adapterIdx, adapter) != Ok)
        {
            throw 'Failed to Enum Adapter 0';
        }
        if (adapter.enumOutputs(outputIdx, output) != Ok)
        {
            throw 'Failed to Enum Output 0';
        }

        var swapChainDescription = new DxgiSwapChainDescription();
        swapChainDescription.bufferDesc.width  = 1280;
        swapChainDescription.bufferDesc.height = 720;
        swapChainDescription.bufferDesc.format = R8G8B8A8UNorm;
        swapChainDescription.sampleDesc.count  = 1;
        swapChainDescription.bufferCount       = 1;
        swapChainDescription.bufferUsage       = RenderTargetOutput;
        swapChainDescription.windowed          = true;
        swapChainDescription.outputWindow      = hwnd;

        if (D3d11.createDevice(adapter, Unknown, null, 0, null, D3d11.SdkVersion, device, null, context) != Ok)
        {
            throw 'failed to created device and context';
        }
        if (factory.createSwapChain(device, swapChainDescription, swapchain) != Ok)
        {
            throw 'failed to create swap chain';
        }

        viewport = new D3d11Viewport();
        viewport.topLeftX = 0;
        viewport.topLeftY = 0;
        viewport.width    = 1280;
        viewport.height   = 720;

        clipRect = new D3d11Rect();
        clipRect.top    = 0;
        clipRect.left   = 0;
        clipRect.right  = 1280;
        clipRect.bottom = 720;

        var rasterizerDescription = new D3d11RasterizerDescription();
        rasterizerDescription.fillMode              = Solid;
        rasterizerDescription.cullMode              = None;
        rasterizerDescription.frontCounterClockwise = false;
        rasterizerDescription.depthBias             = 0;
        rasterizerDescription.slopeScaledDepthBias  = 0;
        rasterizerDescription.depthBiasClamp        = 0;
        rasterizerDescription.depthClipEnable       = true;
        rasterizerDescription.scissorEnable         = true;
        rasterizerDescription.multisampleEnable     = false;
        rasterizerDescription.antialiasedLineEnable = false;

        if (device.createRasterizerState(rasterizerDescription, rasterize) != Ok)
        {
            throw 'failed to create rasterizer state';
        }

        var blendDesc = new D3d11BlendDescription();
        blendDesc.alphaToCoverageEnable                 = false;
        blendDesc.independentBlendEnable                = false;
        blendDesc.renderTarget[0].blendEnable           = true;
        blendDesc.renderTarget[0].srcBlend              = SourceAlpha;
        blendDesc.renderTarget[0].srcBlendAlpha         = One;
        blendDesc.renderTarget[0].destBlend             = InverseSourceAlpha;
        blendDesc.renderTarget[0].destBlendAlpha        = Zero;
        blendDesc.renderTarget[0].blendOp               = Add;
        blendDesc.renderTarget[0].blendOpAlpha          = Add;
        blendDesc.renderTarget[0].renderTargetWriteMask = D3d11ColorWriteEnable.All;

        if (device.createBlendState(blendDesc, blending) != Ok)
        {
            throw 'failed to create blend state';
        }

        var bufferDesc = new D3d11BufferDescription();
        bufferDesc.byteWidth      = 128;
        bufferDesc.usage          = Dynamic;
        bufferDesc.bindFlags      = D3d11BindFlag.VertexBuffer;
        bufferDesc.cpuAccessFlags = D3d11CpuAccessFlag.Write;

        var initialBytes = new D3d11SubResourceData();
        initialBytes.systemMemory = Bytes.alloc(128).getData();
        initialBytes.systemMemoryPitch = 32;

        if (device.createBuffer(bufferDesc, initialBytes, buffer) != Ok)
        {
            throw 'failed to create buffer';
        }

        var depthTextureDescription = new D3d11Texture2DDescription();
        depthTextureDescription.width              = 1280;
        depthTextureDescription.height             = 720;
        depthTextureDescription.mipLevels          = 1;
        depthTextureDescription.arraySize          = 1;
        depthTextureDescription.format             = D32FloatS8X24UInt;
        depthTextureDescription.sampleDesc.count   = 1;
        depthTextureDescription.sampleDesc.quality = 0;
        depthTextureDescription.usage              = D3d11Usage.Default;
        depthTextureDescription.bindFlags          = D3d11BindFlag.DepthStencil;
        depthTextureDescription.cpuAccessFlags     = 0;
        depthTextureDescription.miscFlags          = 0;

        if (device.createTexture2D(depthTextureDescription, null, depthTex) != Ok)
        {
            throw 'failed to create depth texture';
        }

        var depthStencilViewDescription = new D3d11DepthStencilViewDescription();
        depthStencilViewDescription.format             = D32FloatS8X24UInt;
        depthStencilViewDescription.viewDimension      = Texture2D;
        depthStencilViewDescription.texture2D.mipSlice = 0;

        if (device.createDepthStencilView(depthTex, depthStencilViewDescription, dsvView) != Ok)
        {
            throw 'failed to create depth stencil view';
        }

        var mappedBuffer = new D3d11MappedSubResource();
        if (context.map(buffer, 0, WriteDiscard, 0, mappedBuffer) != Ok)
        {
            throw 'failed to map buffer';
        }

        (mappedBuffer.data.reinterpret() : Pointer<Int>)[0] = 7;

        context.unmap(buffer, 0);

        swapTex = new D3d11Texture2D();
        if (swapchain.getBuffer(0, NativeID3D11Texture2D.uuid(), swapTex) != Ok)
        {
            throw 'failed to get swapchain texture';
        }

        renderView = new D3d11RenderTargetView();
        if (device.createRenderTargetView(swapTex, null, renderView) != Ok)
        {
            throw 'failed to create render target view';
        }

        context.omSetRenderTargets([ renderView ], dsvView);
        context.iaSetVertexBuffers(0, [ buffer ], [ 0 ], [ 0 ]);
        context.rsSetViewports([ viewport ]);

        trace('done');
    }
}
