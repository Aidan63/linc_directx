package dxgi.structures;

import cpp.Function;
import cpp.Star;
import cpp.Pointer;
import cpp.vm.Gc;
import com.HWND;
import dxgi.constants.DxgiUsage;
import dxgi.structures.DxgiModeDescription;
import dxgi.structures.DxgiSampleDescription;
import dxgi.enumerations.DxgiFormat;
import dxgi.enumerations.DxgiScaling;
import dxgi.enumerations.DxgiAlphaMode;
import dxgi.enumerations.DxgiSwapEffect;

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
        Pointer.fromStar(cast _obj.backing).destroy();
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

/**
 * Describes a swap chain.
 */
class DxgiSwapChainDescription1
{
    public final backing : Star<NativeDXGISwapChainDescription1>;

    /**
     * A value that describes the resolution width.
     * If you specify the width as zero when you call the `DxgiFactory2.createSwapChainForHwnd` method to create a swap chain, the runtime obtains the width from the output window and assigns this width value to the swap-chain description.
     * You can subsequently call the `DxgiSwapChain1.getDesc1` method to retrieve the assigned width value.
     * You cannot specify the width as zero when you call the `DxgiFactory2.createSwapChainForComposition` method.
     */
    public var width (get, set) : Int;

    inline function get_width() : Int return backing.width;

    inline function set_width(_v : Int) : Int return backing.width = _v;

    /**
     * A value that describes the resolution height.
     * If you specify the height as zero when you call the `DxgiFactory2.createSwapChainForHwnd` method to create a swap chain, the runtime obtains the height from the output window and assigns this height value to the swap-chain description.
     * You can subsequently call the `DxgiSwapChain1.getDesc1` method to retrieve the assigned height value.
     * You cannot specify the height as zero when you call the `DxgiFactory2.createSwapChainForComposition` method.
     */
    public var height (get, set) : Int;

    inline function get_height() : Int return backing.height;

    inline function set_height(_v : Int) : Int return backing.height = _v;

    /**
     * A `DxgiFormat` structure that describes the display format.
     */
    public var format (get, set) : DxgiFormat;

    inline function get_format() : DxgiFormat return cast backing.format;

    inline function set_format(_v : DxgiFormat) : DxgiFormat
    {
        backing.format = cast _v;

        return _v;
    }

    /**
     * Specifies whether the full-screen display mode or the swap-chain back buffer is stereo.
     * `TRUE` if stereo; otherwise, `FALSE`.
     * If you specify stereo, you must also specify a flip-model swap chain (that is, a swap chain that has the `DxgiSwapEffect.FlipSequential` value set in the SwapEffect member).
     */
    public var stereo (get, set) : Bool;

    inline function get_stereo() : Bool return backing.stereo;

    inline function set_stereo(_v : Bool) : Bool return backing.stereo = _v;

    /**
     * A `DxgiSampleDescription` structure that describes multi-sampling parameters.
     * This member is valid only with bit-block transfer (bitblt) model swap chains.
     */
    public final sampleDesc : DxgiSampleDescription;

    /**
     * A `DxgiUsage`-typed value that describes the surface usage and CPU access options for the back buffer.
     * The back buffer can be used for shader input or render-target output.
     */
    public var bufferUsage (get, set) : DxgiUsage;

    inline function get_bufferUsage() : DxgiUsage return backing.bufferUsage;

    inline function set_bufferUsage(_v : DxgiUsage) : DxgiUsage return backing.bufferUsage = _v;

    /**
     * A value that describes the number of buffers in the swap chain.
     * When you create a full-screen swap chain, you typically include the front buffer in this value.
     */
    public var bufferCount (get, set) : Int;

    inline function get_bufferCount() : Int return backing.bufferCount;

    inline function set_bufferCount(_v : Int) return backing.bufferCount = _v;

    /**
     * A `DxgiScaling`-typed value that identifies resize behavior if the size of the back buffer is not equal to the target output.
     */
    public var scaling (get, set) : DxgiScaling;

    inline function get_scaling() : DxgiScaling return cast backing.scaling;

    inline function set_scaling(_v : DxgiScaling) : DxgiScaling
    {
        backing.scaling = cast _v;

        return _v;
    }

    /**
     * A `DxgiSwapEffect`-typed value that describes the presentation model that is used by the swap chain and options for handling the contents of the presentation buffer after presenting a surface.
     * You must specify the `DxgiSwapEffect.FlipSequential` value when you call the `DxgiFactory2.createSwapChainForComposition` method because this method supports only flip presentation model.
     */
    public var swapEffect (get, set) : DxgiSwapEffect;

    inline function get_swapEffect() : DxgiSwapEffect return cast backing.swapEffect;

    inline function set_swapEffect(_v : DxgiSwapEffect)
    {
        backing.swapEffect = cast _v;

        return _v;
    }

    /**
     * A `DxgiAlphaMode`-typed value that identifies the transparency behavior of the swap-chain back buffer.
     */
    public var alphaMode (get, set) : DxgiAlphaMode;

    inline function get_alphaMode() : DxgiAlphaMode return cast backing.alphaMode;

    inline function set_alphaMode(_v : DxgiAlphaMode) : DxgiAlphaMode
    {
        backing.alphaMode = cast _v;

        return _v;
    }

    /**
     * A combination of `DxgiSwapChainFlag`-typed values that are combined by using a bitwise OR operation.
     * The resulting value specifies options for swap-chain behavior.
     */
    public var flags (get, set) : Int;

    inline function get_flags() : Int return backing.flags;

    inline function set_flags(_v : Int) : Int return backing.flags = _v;

    public function new(_existing : Pointer<NativeDXGISwapChainDescription1> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGISwapChainDescription1.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        sampleDesc = new DxgiSampleDescription(Pointer.addressOf(backing.sampleDesc));
    }

    @:void
    static function finalize(_obj : DxgiSwapChainDescription1)
    {
        Pointer.fromStar(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi1_2.h')
@:native('DXGI_SWAP_CHAIN_DESC1')
extern class NativeDXGISwapChainDescription1
{
    @:native('DXGI_SWAP_CHAIN_DESC1')
    static function createRef() : NativeDXGISwapChainDescription1;

    @:native('new DXGI_SWAP_CHAIN_DESC1')
    static function createPtr() : Star<NativeDXGISwapChainDescription1>;

    @:native('Width')
    var width : cpp.UInt32;

    @:native('Height')
    var height : cpp.UInt32;

    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('Stereo')
    var stereo : Bool;

    @:native('SampleDesc')
    var sampleDesc : NativeDXGISampleDescription;

    @:native('BufferUsage')
    var bufferUsage : DxgiUsage;

    @:native('BufferCount')
    var bufferCount : cpp.UInt32;

    @:native('Scaling')
    var scaling : NativeDXGIScaling;

    @:native('SwapEffect')
    var swapEffect : NativeDXGISwapEffect;

    @:native('AlphaMode')
    var alphaMode : NativeDXGIAlphaMode;

    @:native('Flags')
    var flags : cpp.UInt32;
}
