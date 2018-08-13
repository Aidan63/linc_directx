package d3d.d3d11;

@:unreflective
@:structAccess
@:native("D3D11_VIEWPORT")
@:include("d3d11.h")
extern class Viewport
{
    @:native('D3D11_VIEWPORT')
    static function create() : Viewport;

    @:native('TopLeftX')
    var topLeftX : Float;

    @:native('TopLeftY')
    var topLeftY : Float;

    @:native('Width')
    var width : Float;

    @:native('Height')
    var height : Float;

    @:native('MinDepth')
    var minDepth : Float;

    @:native('MaxDepth')
    var maxDepth : Float;
}
