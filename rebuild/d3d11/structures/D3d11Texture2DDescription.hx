package d3d11.structures;

import cpp.Pointer;
import cpp.Star;
import dxgi.constants.DxgiUsage;
import dxgi.structures.DxgiSampleDescription;
import dxgi.enumerations.DxgiFormat;
import d3d11.enumerations.D3d11Usage;

class D3d11Texture2DDescription
{
    public final backing : Star<NativeD3D11Texture2DDescription>;

    public var width : Int;

    public var height : Int;

    public var mipLevels : Int;

    public var arraySize : Int;

    public var format : DxgiFormat;

    public final sampleDesc : DxgiSampleDescription;

    public var usage : DxgiUsage;

    public var bindFlags : Int;

    public var cpuAccessFlags : Int;

    public var miscFlags : Int;

    public function new(_existing : Pointer<NativeD3D11Texture2DDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11Texture2DDescription.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        sampleDesc = new DxgiSampleDescription(Pointer.addressOf(backing.sampleDesc));
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_TEXTURE2D_DESC')
extern class NativeD3D11Texture2DDescription
{
    @:native('new D3D11_TEXTURE2D_DESC')
    static function createPtr() : Star<NativeD3D11Texture2DDescription>;

    @:native('D3D11_TEXTURE2D_DESC')
    static function createRef() : NativeD3D11Texture2DDescription;

    @:native('Width')
    var width : cpp.UInt32;

    @:native('Height')
    var height : cpp.UInt32;

    @:native('MipLevels')
    var mipLevels : cpp.UInt32;

    @:native('ArraySize')
    var arraySize : cpp.UInt32;

    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('SampleDesc')
    var sampleDesc : NativeDXGISampleDescription;

    @:native('Usage')
    var usage : NativeD3D11Usage;

    @:native('BindFlags')
    var bindFlags : cpp.UInt32;

    @:native('CPUAccessFlags')
    var cpuAccessFlags : cpp.UInt32;

    @:native('MiscFlags')
    var miscFlags : cpp.UInt32;
}
