package d3d11;

@:unreflective
@:structAccess
@:native("D3D11_SUBRESOURCE_DATA")
@:include("d3d11.h")
extern class SubResourceData
{
    @:native('D3D11_SUBRESOURCE_DATA')
    static function create() : SubResourceData;

    @:native('pSysMem')
    var sysMem : cpp.RawConstPointer<cpp.Void>;

    @:native('SysMemPitch')
    var sysMemPitch : Int;

    @:native('SysMemSlicePitch')
    var sysMemSlicePitch : Int;
}
