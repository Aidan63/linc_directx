package dxgi.structures;

import cpp.Function;
import cpp.Star;
import cpp.Pointer;
import cpp.vm.Gc;
import com.HWND;
import dxgi.enumerations.DxgiSwapEffect;
import dxgi.structures.DxgiModeDescription;
import dxgi.structures.DxgiSampleDescription;
import dxgi.constants.DxgiUsage;

/**
 * Describes a swap chain.
 */
class DxgiSwapChainDescription
{
    public final backing : Star<NativeDXGISwapChainDescription>;

    /**
     * A DXGI_MODE_DESC structure that describes the backbuffer display mode.
     */
    public final bufferDesc : DxgiModeDescription;

    /**
     * A DXGI_SAMPLE_DESC structure that describes multi-sampling parameters.
     */
    public final sampleDesc : DxgiSampleDescription;

    /**
     * A member of the DXGI_USAGE enumerated type that describes the surface usage and CPU access options for the back buffer.
     * The back buffer can be used for shader input or render-target output.
     */
    public var bufferUsage (get, set) : DxgiUsage;

    inline function get_bufferUsage() : DxgiUsage return backing.bufferUsage;

    inline function set_bufferUsage(_v : DxgiUsage) : DxgiUsage return backing.bufferUsage = _v;

    /**
     * A value that describes the number of buffers in the swap chain.
     * When you call `IDXGIFactory::CreateSwapChain` to create a full-screen swap chain, you typically include the front buffer in this value.
     * For more information about swap-chain buffers, see Remarks.
     */
    public var bufferCount (get, set) : Int;

    inline function get_bufferCount() : Int return backing.bufferCount;

    inline function set_bufferCount(_v : Int) : Int return backing.bufferCount = _v;

    /**
     * An HWND handle to the output window. This member must not be NULL.
     */
    public var outputWindow (get, set) : HWND;

    inline function get_outputWindow() : HWND return backing.outputWindow;

    inline function set_outputWindow(_v : HWND) : HWND return backing.outputWindow = _v;

    /**
     * A Boolean value that specifies whether the output is in windowed mode. TRUE if the output is in windowed mode; otherwise, FALSE.
     * 
     * We recommend that you create a windowed swap chain and allow the end user to change the swap chain to full screen through `IDXGISwapChain::SetFullscreenState`;
     * that is, do not set this member to FALSE to force the swap chain to be full screen.
     * However, if you create the swap chain as full screen, also provide the end user with a list of supported display modes through the BufferDesc member because a
     * swap chain that is created with an unsupported display mode might cause the display to go black and prevent the end user from seeing anything.
     * 
     * For more information about choosing windowed verses full screen, see `IDXGIFactory::CreateSwapChain`.
     */
    public var windowed (get, set) : Bool;

    inline function get_windowed() : Bool return backing.windowed;

    inline function set_windowed(_v : Bool) : Bool return backing.windowed = _v;

    /**
     * A member of the `DXGI_SWAP_EFFECT` enumerated type that describes options for handling the contents of the presentation buffer after presenting a surface.
     */
    public var swapEffect (get, set) : DxgiSwapEffect;

    inline function get_swapEffect() : DxgiSwapEffect return cast backing.swapEffect;

    inline function set_swapEffect(_v : DxgiSwapEffect) : DxgiSwapEffect
    {
        backing.swapEffect = cast _v;

        return _v;
    }

    /**
     * A member of the `DXGI_SWAP_CHAIN_FLAG` enumerated type that describes options for swap-chain behavior.
     */
    public var flags (get, set) : Int;

    inline function get_flags() : Int return backing.flags;

    inline function set_flags(_v : Int) : Int return backing.flags = _v;

    public function new(_existing : Pointer<NativeDXGISwapChainDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGISwapChainDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        bufferDesc = new DxgiModeDescription(Pointer.addressOf(backing.bufferDesc));
        sampleDesc = new DxgiSampleDescription(Pointer.addressOf(backing.sampleDesc));
    }

    @:void
    static function finalize(_obj : DxgiSwapChainDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_SWAP_CHAIN_DESC')
extern class NativeDXGISwapChainDescription
{
    @:native('DXGI_SWAP_CHAIN_DESC')
    static function createRef() : NativeDXGISwapChainDescription;

    @:native('new DXGI_SWAP_CHAIN_DESC')
    static function createPtr() : Star<NativeDXGISwapChainDescription>;

    @:native('BufferDesc')
    var bufferDesc : NativeDXGIModeDescription;

    @:native('SampleDesc')
    var sampleDesc : NativeDXGISampleDescription;

    @:native('BufferUsage')
    var bufferUsage : DxgiUsage;

    @:native('BufferCount')
    var bufferCount : cpp.UInt32;

    @:native('OutputWindow')
    var outputWindow : HWND;

    @:native('Windowed')
    var windowed : Bool;

    @:native('SwapEffect')
    var swapEffect : NativeDXGISwapEffect;

    @:native('Flags')
    var flags : cpp.UInt32;
}
