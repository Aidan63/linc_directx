package d3d.d3d11;

import cpp.Pointer;
import d3d.d3d11.D3D11;

@:unreflective
@:structAccess
@:native("D3D11_RENDER_TARGET_BLEND_DESC")
@:include("d3d11.h")
extern class RenderTargetBlendDescription
{
    @:native('D3D11_RENDER_TARGET_BLEND_DESC')
    static function create() : RenderTargetBlendDescription;

    @:native('BlendEnable')
    var blendEnable : Bool;

    @:native('SrcBlend')
    var srcBlend : D3D11_BLEND;

    @:native('DestBlend')
    var destBlend : D3D11_BLEND;

    @:native('BlendOp')
    var blendOp : D3D11_BLEND_OP;

    @:native('SrcBlendAlpha')
    var srcBlendAlpha : D3D11_BLEND;

    @:native('DestBlendAlpha')
    var destBlendAlpha : D3D11_BLEND;

    @:native('BlendOpAlpha')
    var blendOpAlpha : D3D11_BLEND_OP;

    @:native('RenderTargetWriteMask')
    var renderTargetWriteMask : D3D11_COLOR_WRITE_ENABLE;
}
