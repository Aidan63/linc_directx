package d3d11.resources;

import dxgi.SampleDescription;
import dxgi.DXGI.DXGI_FORMAT;
import d3d11.D3D11.D3D11_USAGE;
import d3d11.D3D11.D3D11_BIND_FLAG;

@:unreflective
@:structAccess
@:native("D3D11_TEXTURE2D_DESC")
@:include("d3d11.h")
extern class Texture2DDescription
{
    @:native('D3D11_TEXTURE2D_DESC')
    static function create() : Texture2DDescription;

    @:native('Width')
    var width : Int;

    @:native('Height')
    var height : Int;

    @:native('MipLevels')
    var mipLevels : Int;

    @:native('ArraySize')
    var arraySize : Int;

    @:native('Format')
    var format : DXGI_FORMAT;

    @:native('SampleDesc')
    var sampleDesc : SampleDescription;

    @:native('Usage')
    var usage : D3D11_USAGE;

    @:native('BindFlags')
    var bindFlags : D3D11_BIND_FLAG;

    @:native('CPUAccessFlags')
    var cpuAccessFlags : Int;
    
    @:native('MiscFlags')
    var miscFlags : Int;
}
