package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;
import d3d11.enumerations.D3d11CullMode;
import d3d11.enumerations.D3d11FillMode;

/**
 * Describes rasterizer state.
 */
class D3d11RasterizerDescription
{
    public final backing : Star<NativeD3D11RasterizerDescription>;
    
    /**
     * Determines the fill mode to use when rendering (see `D3D11_FILL_MODE`).
     */
    public var fillMode (get, set) : D3dFillMode;

    inline function get_fillMode() : D3dFillMode return cast backing.fillMode;

    inline function set_fillMode(_v : D3dFillMode) : D3dFillMode
    {
        backing.fillMode = cast _v;

        return _v;
    }

    /**
     * Indicates triangles facing the specified direction are not drawn (see `D3D11_CULL_MODE`).
     */
    public var cullMode (get, set) : D3d11CullMode;

    inline function get_cullMode() : D3d11CullMode return cast backing.cullMode;

    inline function set_cullMode(_v : D3d11CullMode) : D3d11CullMode
    {
        backing.cullMode = cast _v;

        return _v;
    }

    /**
     * Determines if a triangle is front- or back-facing.
     * If this parameter is TRUE, a triangle will be considered front-facing if its vertices are counter-clockwise on the render target and considered back-facing if they are clockwise.
     * If this parameter is FALSE, the opposite is true.
     */
    public var frontCounterClockwise (get, set) : Bool;

    inline function get_frontCounterClockwise() : Bool return backing.frontCounterClockwise;

    inline function set_frontCounterClockwise(_v : Bool) return backing.frontCounterClockwise = _v;

    /**
     * Depth value added to a given pixel. For info about depth bias, see Depth Bias.
     */
    public var depthBias (get, set) : Int;

    inline function get_depthBias() : Int return backing.depthBias;

    inline function set_depthBias(_v : Int) : Int return backing.depthBias;

    /**
     * Maximum depth bias of a pixel. For info about depth bias, see Depth Bias.
     */
    public var depthBiasClamp (get, set) : Float;

    inline function get_depthBiasClamp() : Float return backing.depthBiasClamp;

    inline function set_depthBiasClamp(_v : Float) : Float return backing.depthBiasClamp = _v;

    /**
     * Scalar on a given pixel's slope. For info about depth bias, see Depth Bias.
     */
    public var slopeScaledDepthBias (get, set) : Float;

    inline function get_slopeScaledDepthBias() : Float return backing.slopeScaledDepthBias;

    inline function set_slopeScaledDepthBias(_v : Float) return backing.slopeScaledDepthBias = _v;

    /**
     * Enable clipping based on distance.
     * 
     * The hardware always performs x and y clipping of rasterized coordinates.
     * When DepthClipEnable is set to the default–TRUE, the hardware also clips the z value (that is, the hardware performs the last step of the following algorithm).
     * ```
     * 0 < w
     * -w <= x <= w (or arbitrarily wider range if implementation uses a guard band to reduce clipping burden)
     * -w <= y <= w (or arbitrarily wider range if implementation uses a guard band to reduce clipping burden)
     * 0 <= z <= w
     * ```
     * When you set DepthClipEnable to FALSE, the hardware skips the z clipping (that is, the last step in the preceding algorithm).
     * However, the hardware still performs the "0 < w" clipping. When z clipping is disabled, improper depth ordering at the pixel level might result.
     * However, when z clipping is disabled, stencil shadow implementations are simplified. In other words, you can avoid complex special-case handling for geometry that goes beyond the back clipping plane.
     */
    public var depthClipEnable (get, set) : Bool;

    inline function get_depthClipEnable() : Bool return backing.depthClipEnable;

    inline function set_depthClipEnable(_v : Bool) return backing.depthClipEnable = _v;

    /**
     * Enable scissor-rectangle culling. All pixels outside an active scissor rectangle are culled.
     */
    public var scissorEnable (get, set) : Bool;

    inline function get_scissorEnable() : Bool return backing.scissorEnable;

    inline function set_scissorEnable(_v : Bool) : Bool return backing.scissorEnable = _v;

    /**
     * Specifies whether to use the quadrilateral or alpha line anti-aliasing algorithm on multisample antialiasing (MSAA) render targets.
     * Set to TRUE to use the quadrilateral line anti-aliasing algorithm and to FALSE to use the alpha line anti-aliasing algorithm.
     * For more info about this member, see Remarks.
     */
    public var multisampleEnable (get, set) : Bool;

    inline function get_multisampleEnable() : Bool return backing.multisampleEnable;

    inline function set_multisampleEnable(_v : Bool) : Bool return backing.multisampleEnable;

    /**
     * Specifies whether to enable line antialiasing; only applies if doing line drawing and MultisampleEnable is FALSE.
     * For more info about this member, see Remarks.
     */
    public var antialiasedLineEnable (get, set) : Bool;

    inline function get_antialiasedLineEnable() : Bool return backing.antialiasedLineEnable;

    inline function set_antialiasedLineEnable(_v : Bool) : Bool return backing.antialiasedLineEnable;

    public function new(_existing : Pointer<NativeD3D11RasterizerDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11RasterizerDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : D3d11RasterizerDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_RASTERIZER_DESC')
extern class NativeD3D11RasterizerDescription
{
    @:native('D3D11_RASTERIZER_DESC')
    static function createRef() : NativeD3D11RasterizerDescription;

    @:native('new D3D11_RASTERIZER_DESC')
    static function createPtr() : Star<NativeD3D11RasterizerDescription>;

    @:native('FillMode')
    var fillMode : NativeD3D11FillMode;

    @:native('CullMode')
    var cullMode : NativeD3D11CullMode;

    @:native('FrontCounterClockwise')
    var frontCounterClockwise : Bool;

    @:native('DepthBias')
    var depthBias : Int;

    @:native('DepthBiasClamp')
    var depthBiasClamp : cpp.Float32;

    @:native('SlopeScaledDepthBias')
    var slopeScaledDepthBias : cpp.Float32;

    @:native('DepthClipEnable')
    var depthClipEnable : Bool;

    @:native('ScissorEnable')
    var scissorEnable : Bool;

    @:native('MultisampleEnable')
    var multisampleEnable : Bool;

    @:native('AntialiasedLineEnable')
    var antialiasedLineEnable : Bool;
}
