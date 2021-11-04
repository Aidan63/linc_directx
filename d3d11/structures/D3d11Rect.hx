package d3d11.structures;

import cpp.Star;
import cpp.Pointer;
import cpp.Function;
import cpp.vm.Gc;
import haxe.Int64;

/**
 * The RECT structure defines the coordinates of the upper-left and lower-right corners of a rectangle.
 */
class D3d11Rect
{
    public final backing : Star<NativeD3D11Rect>;

    /**
     * The x-coordinate of the upper-left corner of the rectangle.
     */
    public var left (get, set) : Int64;

    inline function get_left() : Int64 return backing.left;

    inline function set_left(_v : Int64) return backing.left = _v;

    /**
     * The y-coordinate of the upper-left corner of the rectangle.
     */
    public var top (get, set) : Int64;

    inline function get_top() : Int64 return backing.top;

    inline function set_top(_v : Int64) return backing.top = _v;

    /**
     * The x-coordinate of the lower-right corner of the rectangle.
     */
    public var right (get, set) : Int64;

    inline function get_right() : Int64 return backing.right;

    inline function set_right(_v : Int64) return backing.right = _v;

    /**
     * The y-coordinate of the lower-right corner of the rectangle.
     */
    public var bottom (get, set) : Int64;

    inline function get_bottom() : Int64 return backing.bottom;

    inline function set_bottom(_v : Int64) return backing.bottom = _v;

    public function new(_existing : Pointer<NativeD3D11Rect> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Rect.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11Rect)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_RECT')
extern class NativeD3D11Rect
{
    @:native('D3D11_RECT')
    static function createRef() : NativeD3D11Rect;

    @:native('new D3D11_RECT')
    static function createPtr() : Star<NativeD3D11Rect>;

    var left : cpp.Int64;

    var top : cpp.Int64;

    var right : cpp.Int64;

    var bottom : cpp.Int64;
}
