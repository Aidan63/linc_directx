package dxgi.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Star;
import cpp.Pointer;
import dxgi.structures.DxgiRational;
import dxgi.enumerations.DxgiFormat;
import dxgi.enumerations.DxgiModeScanlineOrder;
import dxgi.enumerations.DxgiModeScaling;

/**
 * Describes a display mode.
 */
class DxgiModeDescription
{
    public final backing : Star<NativeDXGIModeDescription>;

    /**
     * A value that describes the resolution width.
     * If you specify the width as zero when you call the `IDXGIFactory::CreateSwapChain` method to create a swap chain,
     * the runtime obtains the width from the output window and assigns this width value to the swap-chain description.
     * You can subsequently call the `IDXGISwapChain::GetDesc` method to retrieve the assigned width value.
     */
    public var width (get, set) : Int;

    inline function get_width() : Int return backing.width;

    inline function set_width(_v : Int) : Int return backing.width = _v;

    /**
     * A value describing the resolution height.
     * If you specify the height as zero when you call the `IDXGIFactory::CreateSwapChain` method to create a swap chain,
     * the runtime obtains the height from the output window and assigns this height value to the swap-chain description.
     * You can subsequently call the `IDXGISwapChain::GetDesc` method to retrieve the assigned height value.
     */
    public var height (get, set) : Int;

    inline function get_height() : Int return backing.height;

    inline function set_height(_v : Int) : Int return backing.height = _v;

    /**
     * A `DXGI_RATIONAL` structure describing the refresh rate in hertz.
     */
    public final refreshRate : DxgiRational;

    /**
     * A `DXGI_FORMAT` structure describing the display format.
     */
    public var format (get, set) : DxgiFormat;

    inline function get_format() : DxgiFormat return cast backing.format;

    inline function set_format(_v : DxgiFormat) : DxgiFormat
    {
        backing.format = cast _v;

        return _v;
    }

    /**
     * A member of the DXGI_MODE_SCANLINE_ORDER enumerated type describing the scanline drawing mode.
     */
    public var scalineOrdering : DxgiModeScanlineOrder;

    inline function get_scalineOrdering() : DxgiModeScanlineOrder return cast backing.scanlineOrdering;

    inline function set_scalineOrdering(_v : DxgiModeScanlineOrder) : DxgiModeScanlineOrder
    {
        backing.scanlineOrdering = cast _v;

        return _v;
    }

    /**
     * A member of the DXGI_MODE_SCALING enumerated type describing the scaling mode.
     */
    public var scaling (get, set) : DxgiModeScaling;

    inline function get_scaling() return cast backing.scaling;

    inline function set_scaling(_v : DxgiModeScaling) : DxgiModeScaling
    {
        backing.scaling = cast _v;

        return _v;
    }

    public function new(_existing : Pointer<NativeDXGIModeDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGIModeDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }

        refreshRate = new DxgiRational(Pointer.addressOf(backing.refreshRate));
    }

    @:void
    static function finalize(_obj : DxgiModeDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_MODE_DESC')
extern class NativeDXGIModeDescription
{
    @:native('DXGI_MODE_DESC')
    static function createRef() : NativeDXGIModeDescription;

    @:native('new DXGI_MODE_DESC')
    static function createPtr() : Star<NativeDXGIModeDescription>;

    @:native('Width')
    var width : Int;

    @:native('Height')
    var height : Int;

    @:native('RefreshRate')
    var refreshRate : NativeDXGIRational;

    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('ScanlineOrdering')
    var scanlineOrdering : NativeDXGIModeScanlineOrder;

    @:native('Scaling')
    var scaling : NativeDXGIModeScaling;
}
