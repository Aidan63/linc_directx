package d3d11;

@:unreflective
@:structAccess
@:native("D3D11_BLEND_DESC")
@:include("d3d11.h")
extern class BlendDescription
{
    @:native('D3D11_BLEND_DESC')
    static function create() : BlendDescription;

    @:native('AlphaToCoverageEnable')
    var alphaToCoverageEnable : Bool;

    @:native('IndependentBlendEnable')
    var independentBlendEnable : Bool;

    @:native('RenderTarget')
    var renderTarget : cpp.RawPointer<RenderTargetBlendDescription>;
}
