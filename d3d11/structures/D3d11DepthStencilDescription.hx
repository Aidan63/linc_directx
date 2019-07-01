package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;
import d3d11.enumerations.D3d11DepthWriteMask;
import d3d11.enumerations.D3d11ComparisonFunction;
import d3d11.structures.D3d11DepthStencilOpDescription;

/**
 * Describes depth-stencil state.
 */
class D3d11DepthStencilDescription
{
    public final backing : Star<NativeD3D11DepthStencilDescription>;

    /**
     * Enable depth testing.
     */
    public var depthEnable (get, set) : Bool;

    inline function get_depthEnable() : Bool return backing.depthEnable;

    inline function set_depthEnable(_v : Bool) : Bool return backing.depthEnable = _v;

    /**
     * Identify a portion of the depth-stencil buffer that can be modified by depth data (see `D3D11_DEPTH_WRITE_MASK`).
     */
    public var depthWriteMask (get, set) : D3d11DepthWriteMask;

    inline function get_depthWriteMask() : D3d11DepthWriteMask return cast backing.depthWriteMask;

    inline function set_depthWriteMask(_v : D3d11DepthWriteMask) : D3d11DepthWriteMask
    {
        backing.depthWriteMask = cast _v;

        return _v;
    }

    /**
     * A function that compares depth data against existing depth data. The function options are listed in `D3D11_COMPARISON_FUNC`.
     */
    public var depthFunction (get, set) : D3d11ComparisonFunction;

    inline function get_depthFunction() : D3d11ComparisonFunction return cast backing.depthFunction;

    inline function set_depthFunction(_v : D3d11ComparisonFunction) : D3d11ComparisonFunction
    {
        backing.depthFunction = cast _v;

        return _v;
    }

    /**
     * Enable stencil testing.
     */
    public var stencilEnable (get, set) : Bool;

    inline function get_stencilEnable() : Bool return backing.stencilEnable;

    inline function set_stencilEnable(_v : Bool) : Bool return backing.stencilEnable = _v;

    /**
     * Identify a portion of the depth-stencil buffer for reading stencil data.
     */
    public var stencilReadMask (get, set) : Int;

    inline function get_stencilReadMask() : Int return backing.stencilReadMask;

    inline function set_stencilReadMask(_v : Int) : Int return backing.stencilReadMask = _v;

    /**
     * Identify a portion of the depth-stencil buffer for writing stencil data.
     */
    public var stencilWriteMask (get, set) : Int;

    inline function get_stencilWriteMask() : Int return backing.stencilWriteMask;

    inline function set_stencilWriteMask(_v : Int) : Int return backing.stencilWriteMask = _v;

    /**
     * Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing towards the camera (see `D3D11_DEPTH_STENCILOP_DESC`).
     */
    public final frontFace : D3d11DepthStencilOpDescription;

    /**
     * Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera (see `D3D11_DEPTH_STENCILOP_DESC`).
     */
    public final backFace : D3d11DepthStencilOpDescription;

    public function new(_existing : Pointer<NativeD3D11DepthStencilDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11DepthStencilDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalise));
        }
        else
        {
            backing = _existing.ptr;
        }

        frontFace = new D3d11DepthStencilOpDescription(Pointer.addressOf(backing.frontFace));
        backFace  = new D3d11DepthStencilOpDescription(Pointer.addressOf(backing.backFace));
    }

    @:void
    static function finalise(_obj : D3d11DepthStencilDescription)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DEPTH_STENCIL_DESC')
extern class NativeD3D11DepthStencilDescription
{
    @:native('new D3D11_DEPTH_STENCIL_DESC')
    static function createPtr() : Star<NativeD3D11DepthStencilDescription>;

    @:native('D3D11_DEPTH_STENCIL_DESC')
    static function createRef() : NativeD3D11DepthStencilDescription;

    @:native('DepthEnable')
    var depthEnable : Bool;

    @:native('DepthWriteMask')
    var depthWriteMask : NativeD3D11DepthWriteMask;

    @:native('DepthFunc')
    var depthFunction : NativeD3D11ComparisonFunction;

    @:native('StencilEnable')
    var stencilEnable : Bool;

    @:native('StencilReadMask')
    var stencilReadMask : cpp.UInt8;

    @:native('StencilWriteMask')
    var stencilWriteMask : cpp.UInt8;

    @:native('FrontFace')
    var frontFace : NativeD3D11DepthStencilOpDescription;

    @:native('BackFace')
    var backFace : NativeD3D11DepthStencilOpDescription;
}
