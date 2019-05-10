package d3d11;

import d3d11.D3D11.D3D11_STENCIL_OP;
import d3d11.D3D11.D3D11_COMPARISON_FUNC;

@:unreflective
@:structAccess
@:native("D3D11_DEPTH_STENCILOP_DESC")
@:include("d3d11.h")
extern class DepthStencilOpDescription
{
    @:native('D3D11_DEPTH_STENCILOP_DESC')
    static function create() : DepthStencilOpDescription;

    @:native('StencilFailOp') var stencilFailOp : D3D11_STENCIL_OP;
    @:native('StencilDepthFailOp') var stencilDepthFailOp : D3D11_STENCIL_OP;
    @:native('StencilPassOp') var stencilPassOp : D3D11_STENCIL_OP;
    @:native('StencilFunc') var stencilFunc : D3D11_COMPARISON_FUNC;
}
