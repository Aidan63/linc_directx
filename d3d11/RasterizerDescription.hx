package d3d11;

import d3d11.D3D11.D3D11_CULL_MODE;
import d3d11.D3D11.D3D11_FILL_MODE;

@:unreflective
@:structAccess
@:native("D3D11_RASTERIZER_DESC")
@:include("d3d11.h")
extern class RasterizerDescription
{
    @:native('D3D11_RASTERIZER_DESC')
    static function create() : RasterizerDescription;

    @:native('FillMode')
    var fillMode : D3D11_FILL_MODE;

    @:native('CullMode')
    var cullMode : D3D11_CULL_MODE;

    @:native('FrontCounterClockwise')
    var frontCounterClockwise : Bool;

    @:native('DepthBias')
    var depthBias : Int;

    @:native('DepthBiasClamp')
    var depthBiasClamp : cpp.Float32;

    @:native('SlopeScaledDepthBias')
    var slopeScaledDepthBias : cpp.Float32;

    @:native('DepthClipEnable')
    var depthClipEnabled : Bool;

    @:native('ScissorEnable')
    var scissorEnable : Bool;

    @:native('MultisampleEnable')
    var multisampleEnable : Bool;

    @:native('AntialiasedLineEnable')
    var antialiasedLineEnable : Bool;
}
