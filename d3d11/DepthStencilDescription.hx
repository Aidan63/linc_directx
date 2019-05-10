package d3d11;

import d3d11.D3D11.D3D11_DEPTH_WRITE_MASK;
import d3d11.D3D11.D3D11_COMPARISON_FUNC;
import d3d11.DepthStencilOpDescription;

@:unreflective
@:structAccess
@:native("D3D11_DEPTH_STENCIL_DESC")
@:include("d3d11.h")
extern class DepthStencilDescription
{
    @:native('D3D11_DEPTH_STENCIL_DESC')
    static function create() : DepthStencilDescription;

    @:native('DepthEnable') var depthEnable : Bool;
    @:native('DepthWriteMask') var depthWriteMask : D3D11_DEPTH_WRITE_MASK;
    @:native('DepthFunc') var depthFunc : D3D11_COMPARISON_FUNC;
    @:native('StencilEnable') var stencilEnable : Bool;
    @:native('StencilReadMask') var stencilReadMask : cpp.UInt8;
    @:native('StencilWriteMask') var stencilWriteMask : cpp.UInt8;
    @:native('FrontFace') var frontFace : DepthStencilOpDescription;
    @:native('BackFace') var backFace : DepthStencilOpDescription;
}
