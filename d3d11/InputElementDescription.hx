package d3d11;

import d3d11.D3D11.D3D11_INPUT_CLASSIFICATION;
import dxgi.DXGI.DXGI_FORMAT;

@:unreflective
@:structAccess
@:native("D3D11_INPUT_ELEMENT_DESC")
@:include("d3d11.h")
extern class InputElementDescription
{
    @:native('D3D11_INPUT_ELEMENT_DESC')
    static function create() : InputElementDescription;

    @:native('SemanticName')
    var semanticName : cpp.ConstCharStar;

    @:native('SemanticIndex')
    var semanticIndex : Int;

    @:native('Format')
    var format : DXGI_FORMAT;

    @:native('InputSlot')
    var inputSlot : Int;

    @:native('AlignedByteOffset')
    var alignedByteOffset : Int;

    @:native('InputSlotClass')
    var inputSlotClass : D3D11_INPUT_CLASSIFICATION;

    @:native('InstanceDataStepRate')
    var instanceDataStepRate : Int;
}

@:unreflective
@:structAccess
@:native("std::vector<D3D11_INPUT_ELEMENT_DESC>")
@:include('d3d11.h')
extern class InputElementDescriptionArray
{
    @:native('std::vector<D3D11_INPUT_ELEMENT_DESC>')
    static function create() : InputElementDescriptionArray;

    inline function add(_semanticName : String, _semanticIndex : Int, _format : DXGI_FORMAT, _inputSlot : Int, _alignedByteOffset : Int, _inputSlotClass : D3D11_INPUT_CLASSIFICATION, _instanceDataStepRate : Int) : Void
    {
        untyped __cpp__('{0}.push_back({ {1}, {2}, {3}, {4}, {5}, {6}, {7} })', this, _semanticName, _semanticIndex, _format, _inputSlot, _alignedByteOffset, _inputSlotClass, _instanceDataStepRate);
    }
}
