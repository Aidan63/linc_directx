package d3d11;

@:unreflective
@:structAccess
@:native("D3D11_MAPPED_SUBRESOURCE")
@:include("d3d11.h")
extern class MappedSubResource
{
    @:native('D3D11_MAPPED_SUBRESOURCE')
    static function create() : MappedSubResource;

    @:native('pData')
    var sysMem : cpp.RawPointer<cpp.Void>;

    @:native('RowPitch')
    var rowPitch : Int;

    @:native('DepthPitch')
    var depthPitch : Int;
}
