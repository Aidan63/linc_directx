package dxgi.structures;

import cpp.Star;
import cpp.Pointer;
import cpp.Function;
import cpp.vm.Gc;
import dxgi.structures.DxgiRational;
import dxgi.enumerations.DxgiModeScaling;
import dxgi.enumerations.DxgiModeScanlineOrder;

/**
 * Describes full-screen mode for a swap chain.
 */
class DxgiSwapChainFullscreenDescription
{
    public final backing : Star<NativeDXGISwapChainFullscreenDescription>;

    /**
     * A `DxgiRational` structure that describes the refresh rate in hertz.
     */
    public final refreshRate : DxgiRational;

    /**
     * A member of the `DxgiModeScanlineOrder` enumerated type that describes the scan-line drawing mode.
     */
    public var scanlineOrdering (get, set) : DxgiModeScanlineOrder;

    inline function get_scanlineOrdering() : DxgiModeScanlineOrder return cast backing.scanlineOrdering;

    inline function set_scanlineOrdering(_v : DxgiModeScanlineOrder) : DxgiModeScanlineOrder
    {
        backing.scanlineOrdering = cast _v;

        return _v;
    }

    /**
     * A member of the `DxgiModeScaling` enumerated type that describes the scaling mode.
     */
    public var scaling (get, set) : DxgiModeScaling;

    inline function get_scaling() : DxgiModeScaling return cast backing.scaling;

    inline function set_scaling(_v : DxgiModeScaling) : DxgiModeScaling
    {
        backing.scaling = cast _v;

        return _v;
    }

    /**
     * A Boolean value that specifies whether the swap chain is in windowed mode.
     * `TRUE` if the swap chain is in windowed mode; otherwise, `FALSE`.
     */
    public var windowed (get, set) : Bool;

    inline function get_windowed() : Bool return backing.windowed;

    inline function set_windowed(_v : Bool) : Bool return backing.windowed = _v;

    public function new(_existing : Pointer<NativeDXGISwapChainFullscreenDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGISwapChainFullscreenDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        refreshRate = new DxgiRational(Pointer.addressOf(backing.refreshRate));
    }

    @:void
    static function finalize(_obj : DxgiSwapChainFullscreenDescription)
    {
        Pointer.fromStar(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi1_2.h')
@:native('DXGI_SWAP_CHAIN_FULLSCREEN_DESC')
extern class NativeDXGISwapChainFullscreenDescription
{
    @:native('DXGI_SWAP_CHAIN_FULLSCREEN_DESC')
    static function createRef() : NativeDXGISwapChainFullscreenDescription;

    @:native('new DXGI_SWAP_CHAIN_FULLSCREEN_DESC')
    static function createPtr() : Star<NativeDXGISwapChainFullscreenDescription>;

    @:native('RefreshRate')
    var refreshRate : NativeDXGIRational;

    @:native('ScanlineOrdering')
    var scanlineOrdering : NativeDXGIModeScanlineOrder;

    @:native('Scaling')
    var scaling : NativeDXGIModeScaling;

    @:native('Windowed')
    var windowed : Bool;
}
