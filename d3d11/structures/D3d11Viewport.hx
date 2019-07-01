package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;

/**
 * Defines the dimensions of a viewport.
 * 
 * In all cases, Width and Height must be >= 0 and TopLeftX + Width and TopLeftY + Height must be <= `D3D11_VIEWPORT_BOUNDS_MAX`.
 */
class D3d11Viewport
{
    public final backing : Star<NativeD3D11Viewport>;

    /**
     * X position of the left hand side of the viewport. Ranges between `D3D11_VIEWPORT_BOUNDS_MIN` and `D3D11_VIEWPORT_BOUNDS_MAX`.
     */
    public var topLeftX (get, set) : Float;
    
    function get_topLeftX() : Float return backing.topLeftX;
    
    function set_topLeftX(_v : Float) : Float return backing.topLeftX = _v;

    /**
     * Y position of the top of the viewport. Ranges between `D3D11_VIEWPORT_BOUNDS_MIN` and `D3D11_VIEWPORT_BOUNDS_MAX`.
     */
    public var topLeftY (get, set) : Float;
    
    function get_topLeftY() : Float return backing.topLeftY;
    
    function set_topLeftY(_v : Float) : Float return backing.topLeftY = _v;

    /**
     * Width of the viewport.
     */
    public var width(get, set) : Float;
    
    function get_width() : Float return backing.width;
    
    function set_width(_v : Float) : Float return backing.width = _v;

    /**
     * Height of the viewport.
     */
    public var height (get, set) : Float;
    
    function get_height() : Float return backing.height;
    
    function set_height(_v : Float) : Float return backing.height = _v;

    /**
     * Minimum depth of the viewport. Ranges between 0 and 1.
     */
    public var minDepth (get, set) : Float;
    
    function get_minDepth() : Float return backing.minDepth;
    
    function set_minDepth(_v : Float) : Float return backing.maxDepth = _v;

    /**
     * Maximum depth of the viewport. Ranges between 0 and 1.
     */
    public var maxDepth (get, set) : Float;
    
    function get_maxDepth() : Float return backing.maxDepth;
    
    function set_maxDepth(_v : Float) : Float return backing.maxDepth = _v;

    public function new(_existing : Pointer<NativeD3D11Viewport> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Viewport.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11Viewport)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_VIEWPORT')
extern class NativeD3D11Viewport
{
    @:native('D3D11_VIEWPORT')
    static function createRef() : NativeD3D11Viewport;

    @:native('new D3D11_VIEWPORT')
    static function createPtr() : Star<NativeD3D11Viewport>;

    @:native('TopLeftX')
    var topLeftX : cpp.Float32;

    @:native('TopLeftY')
    var topLeftY : cpp.Float32;

    @:native('Width')
    var width : cpp.Float32;

    @:native('Height')
    var height : cpp.Float32;

    @:native('MinDepth')
    var minDepth : cpp.Float32;

    @:native('MaxDepth')
    var maxDepth : cpp.Float32;
}
