package d3d11.enumerations;

class D3d11DsvFlag
{
    var ReadOnlyDepth = 0x1;
    var ReadOnlyStencil = 0x2;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_DSV_FLAG')
extern class NativeD3D11DsvFlag
{
    //
}
