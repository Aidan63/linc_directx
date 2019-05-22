package d3d11.structures;

import dxgi.enumerations.DxgiFormat;
import d3d11.enumerations.D3d11DsvDimension;

class D3d11DepthStencilViewDescription
{
    //
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DEPTH_STENCIL_VIEW_DESC')
extern class NativeD3D11DepthStencilViewDescription
{
    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('ViewDimension')
    var viewDimension : NativeD3D11DSVDimension;

    @:native('Flags')
    var flags : cpp.UInt32;
}
