package d3d11.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Pointer;
import cpp.Star;

/**
 * Defines a 3D box.
 */
class D3d11Box
{
    public final backing : Star<NativeD3D11Box>;

    /**
     * The x position of the left hand side of the box.
     */
    public var left (get, set) : Int;

    inline function get_left() return backing.left;

    inline function set_left(_v) return backing.left = _v;

    /**
     * The y position of the top of the box.
     */
    public var top (get, set) : Int;

    inline function get_top() return backing.top;

    inline function set_top(_v) return backing.top = _v;

    /**
     * The z position of the front of the box.
     */
    public var front (get, set) : Int;

    inline function get_front() return backing.front;

    inline function set_front(_v) return backing.front = _v;

    /**
     * The x position of the right hand side of the box.
     */
    public var right (get, set) : Int;

    inline function get_right() return backing.right;

    inline function set_right(_v) return backing.right = _v;

    /**
     * The y position of the bottom of the box.
     */
    public var bottom (get, set) : Int;

    inline function get_bottom() return backing.bottom;

    inline function set_bottom(_v) return backing.bottom = _v;

    /**
     * The z position of the back of the box.
     */
    public var back (get, set) : Int;

    inline function get_back() return backing.back;

    inline function set_back(_v) return backing.back = _v;

    public function new(_existing : Pointer<NativeD3D11Box> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Box.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11Box)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_BOX')
extern class NativeD3D11Box
{
    @:native('D3D11_BOX')
    static function createRef() : NativeD3D11Box;

    @:native('new D3D11_BOX')
    static function createPtr() : Star<NativeD3D11Box>;

    var left : cpp.UInt32;

    var top : cpp.UInt32;

    var front : cpp.UInt32;

    var right : cpp.UInt32;

    var bottom : cpp.UInt32;

    var back : cpp.UInt32;
}