package dxgi.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Star;
import cpp.Pointer;

/**
 * Represents a rational number.
 * 
 * The `DXGI_RATIONAL` structure operates under the following rules:
 * 
 * - 0/0 is legal and will be interpreted as 0/1.
 * - 0/anything is interpreted as zero.
 * - If you are representing a whole number, the denominator should be 1.
 */
class DxgiRational
{
    public final backing : Star<NativeDXGIRational>;

    /**
     * An unsigned integer value representing the top of the rational number.
     */
    public var numerator (get, set) : Int;

    inline function get_numerator() : Int return backing.numerator;

    inline function set_numerator(_v : Int) : Int return backing.numerator = _v;

    /**
     * An unsigned integer value representing the bottom of the rational number.
     */
    public var denominator (get, set) : Int;

    inline function get_denominator() : Int return backing.denominator;

    inline function set_denominator(_v : Int) : Int return backing.denominator = _v;

    public function new(_existing : Pointer<NativeDXGIRational> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGIRational.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : DxgiRational)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_RATIONAL')
extern class NativeDXGIRational
{
    @:native('DXGI_RATIONAL')
    static function createRef() : NativeDXGIRational;

    @:native('new DXGI_RATIONAL')
    static function createPtr() : Star<NativeDXGIRational>;

    @:native('Numerator')
    var numerator : cpp.UInt32;

    @:native('Denominator')
    var denominator : cpp.UInt32;
}
