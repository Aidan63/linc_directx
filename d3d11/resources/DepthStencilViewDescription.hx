package d3d11.resources;

import dxgi.DXGI.DXGI_FORMAT;
import d3d11.D3D11.D3D11_DSV_DIMENSION;

@:unreflective
@:structAccess
@:native("D3D11_DEPTH_STENCIL_VIEW_DESC")
@:include("d3d11.h")
extern class DepthStencilViewDescription
{
    @:native('D3D11_DEPTH_STENCIL_VIEW_DESC')
    static function create() : DepthStencilViewDescription;

    @:native('Format')
    var format : DXGI_FORMAT;

    @:native('Flags')
    var flags : cpp.UInt32;

    @:native('ViewDimension')
    var viewDimension : D3D11_DSV_DIMENSION;

    @:native('Texture2D')
    var texture2D : Tex2DDSV;
}

@:unreflective
@:structAccess
@:native("D3D11_TEX2D_DSV")
@:include("d3d11.h")
extern class Tex2DDSV
{
    @:native('D3D11_TEX2D_DSV')
    static function create() : Tex2DDSV;

    @:native('MipSlice') var mipSlice : cpp.UInt32;
}

