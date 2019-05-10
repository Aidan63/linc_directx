package d3d11;

import d3d11.D3D11.D3D11_FILTER;
import d3d11.D3D11.D3D11_TEXTURE_ADDRESS_MODE;
import d3d11.D3D11.D3D11_COMPARISON_FUNC;

@:unreflective
@:structAccess
@:native("D3D11_SAMPLER_DESC")
@:include("d3d11.h")
extern class SamplerDescription
{
    @:native('D3D11_SAMPLER_DESC')
    static function create() : SamplerDescription;

    @:native('Filter')
    var filter : D3D11_FILTER;

    @:native('AddressU')
    var addressU : D3D11_TEXTURE_ADDRESS_MODE;

    @:native('AddressV')
    var addressV : D3D11_TEXTURE_ADDRESS_MODE;

    @:native('AddressW')
    var addressW : D3D11_TEXTURE_ADDRESS_MODE;

    @:native('MipLODBias')
    var mipLODBias : cpp.Float32;

    @:native('MaxAnisotropy')
    var maxAnisotropy : Int;

    @:native('ComparisonFunc')
    var comparisonFunc : D3D11_COMPARISON_FUNC;

    @:native('BorderColor')
    var borderColor : cpp.RawPointer<cpp.Float32>;

    @:native('MinLOD')
    var minLOD : cpp.Float32;

    @:native('MaxLOD')
    var maxLOD : cpp.Float32;
}
