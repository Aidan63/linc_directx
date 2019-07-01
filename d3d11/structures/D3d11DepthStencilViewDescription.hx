package d3d11.structures;

import cpp.Function;
import cpp.Pointer;
import cpp.Star;
import cpp.vm.Gc;
import dxgi.enumerations.DxgiFormat;
import d3d11.enumerations.D3d11DsvDimension;
import d3d11.structures.D3d11Tex1DDsv;
import d3d11.structures.D3d11Tex1DArrayDsv;
import d3d11.structures.D3d11Tex2DDsv;
import d3d11.structures.D3d11Tex2DArrayDsv;
import d3d11.structures.D3d11Tex2DMSDsv;
import d3d11.structures.D3d11Tex2DMSArrayDsv;

/**
 * Specifies the subresources of a texture that are accessible from a depth-stencil view.
 */
class D3d11DepthStencilViewDescription
{
    public final backing : Star<NativeD3D11DepthStencilViewDescription>;

    /**
     * Resource data format (see `DXGI_FORMAT`). See remarks for allowable formats.
     */
    public var format (get, set) : DxgiFormat;

    inline function get_format() : DxgiFormat return cast backing.format;

    inline function set_format(_v : DxgiFormat)
    {
        backing.format = cast _v;

        return _v;
    }

    /**
     * Type of resource (see `D3D11_DSV_DIMENSION`).
     * Specifies how a depth-stencil resource will be accessed; the value is stored in the union in this structure.
     */
    public var viewDimension (get, set) : D3d11DsvDimension;

    inline function get_viewDimension() : D3d11DsvDimension return cast backing.viewDimension;

    inline function set_viewDimension(_v : D3d11DsvDimension) : D3d11DsvDimension
    {
        backing.viewDimension = cast _v;

        return _v;
    }

    /**
     * A value that describes whether the texture is read only.
     * Pass 0 to specify that it is not read only; otherwise, pass one of the members of the `D3D11_DSV_FLAG` enumerated type.
     */
    public var flags (get, set) : Int;

    inline function get_flags() return backing.flags;

    inline function set_flags(_v : Int) return backing.flags = _v;

    /**
     * Specifies a 1D texture subresource (see `D3D11_TEX1D_DSV`).
     */
    public final texture1D : D3d11Tex1DDsv;

    /**
     * Specifies an array of 1D texture subresources (see `D3D11_TEX1D_ARRAY_DSV`).
     */
    public final texture1DArray : D3d11Tex1DArrayDsv;

    /**
     * Specifies a 2D texture subresource (see `D3D11_TEX2D_DSV`).
     */
    public final texture2D : D3d11Tex2DDsv;

    /**
     * Specifies an array of 2D texture subresources (see `D3D11_TEX2D_ARRAY_DSV`).
     */
    public final texture2DArray : D3d11Tex2DArrayDsv;

    /**
     * Specifies a multisampled 2D texture (see `D3D11_TEX2DMS_DSV`).
     */
    public final texture2DMS : D3d11Tex2DMSDsv;

    /**
     * Specifies an array of multisampled 2D textures (see `D3D11_TEX2DMS_ARRAY_DSV`).
     */
    public final texture2DMSArray : D3d11Tex2DMSArrayDsv;

    public function new(_existing : Pointer<NativeD3D11DepthStencilViewDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11DepthStencilViewDescription.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalise));
        }
        else
        {
            backing = _existing.ptr;
        }

        texture1D        = new D3d11Tex1DDsv(Pointer.addressOf(backing.texture1D));
        texture1DArray   = new D3d11Tex1DArrayDsv(Pointer.addressOf(backing.texture1DArray));
        texture2D        = new D3d11Tex2DDsv(Pointer.addressOf(backing.texture2D));
        texture2DArray   = new D3d11Tex2DArrayDsv(Pointer.addressOf(backing.texture2DArray));
        texture2DMS      = new D3d11Tex2DMSDsv(Pointer.addressOf(backing.texture2DMS));
        texture2DMSArray = new D3d11Tex2DMSArrayDsv(Pointer.addressOf(backing.texture2DMSArray));
    }

    @:void
    static function finalise(_obj : D3d11DepthStencilViewDescription)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DEPTH_STENCIL_VIEW_DESC')
extern class NativeD3D11DepthStencilViewDescription
{
    @:native('new D3D11_DEPTH_STENCIL_VIEW_DESC')
    static function createPtr() : Star<NativeD3D11DepthStencilViewDescription>;

    @:native('D3D11_DEPTH_STENCIL_VIEW_DESC')
    static function createRef() : NativeD3D11DepthStencilViewDescription;

    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('ViewDimension')
    var viewDimension : NativeD3D11DSVDimension;

    @:native('Flags')
    var flags : cpp.UInt32;

    @:native('Texture1D')
    var texture1D : NativeD3D11Tex1DDsv;

    @:native('Texture1DArray')
    var texture1DArray : NativeD3D11Tex1DArrayDsv;

    @:native('Texture2D')
    var texture2D : NativeD3D11Tex2DDsv;

    @:native('Texture2DArray')
    var texture2DArray : NativeD3D11Tex2DArrayDsv;

    @:native('Texture2DMS')
    var texture2DMS : NativeD3D11Tex2DMSDsv;

    @:native('Texture2DMSArray')
    var texture2DMSArray : NativeD3D11Tex2DMSArrayDsv;
}
