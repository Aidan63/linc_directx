package d3d.d3d11;

import d3d.d3d11.D3D11.D3D11_BIND_FLAG;
import d3d.d3d11.D3D11.D3D11_USAGE;

@:unreflective
@:structAccess
@:native("D3D11_BUFFER_DESC")
@:include("d3d11.h")
extern class BufferDescription
{
    @:native('D3D11_BUFFER_DESC')
    static function create() : BufferDescription;

    @:native('CD3D11_BUFFER_DESC')
    static function initialize(_byteWidth : Int, _bindFlags : D3D11_BIND_FLAG) : BufferDescription;

    @:native('ByteWidth')
    var byteWidth : Int;

    @:native('Usage')
    var usage : D3D11_USAGE;

    @:native('BindFlags')
    var bindFlags : D3D11_BIND_FLAG;

    @:native('CPUAccessFlags')
    var cpuAccessFlags : Int;

    @:native('MiscFlags')
    var miscFlags : Int;

    @:native('StructureByteStride')
    var structureByteStride : Int;
}
