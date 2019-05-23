package d3d11.structures;

import dxgi.enumerations.DxgiFormat;
import d3d11.enumerations.D3d11DsvDimension;
import d3d11.structures.D3d11Tex1DDsv;
import d3d11.structures.D3d11Tex1DArrayDsv;
import d3d11.structures.D3d11Tex2DDsv;
import d3d11.structures.D3d11Tex2DArrayDsv;
import d3d11.structures.D3d11Tex2DMSDsv;
import d3d11.structures.D3d11Tex2DMSArrayDsv;

class D3d11DepthStencilViewDescription
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DEPTH_STENCIL_VIEW_DESC')
extern class NativeD3D11DepthStencilViewDescription
{
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
