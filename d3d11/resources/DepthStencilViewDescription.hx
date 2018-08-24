package d3d11.resources;

import dxgi.DXGI.DXGI_FORMAT;
import d3d11.D3D11.D3D11_RTV_DIMENSION;

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

    @:native('ViewDimension')
    var viewDimension : D3D11_RTV_DIMENSION;
}
