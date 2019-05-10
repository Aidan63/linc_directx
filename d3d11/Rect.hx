package d3d11;

@:unreflective
@:structAccess
@:native("D3D11_RECT")
@:include("d3d11.h")
extern class Rect
{
    @:native('D3D11_RECT')
    static function create() : Rect;

    var left : Int;

    var top : Int;

    var right : Int;

    var bottom : Int;
}
