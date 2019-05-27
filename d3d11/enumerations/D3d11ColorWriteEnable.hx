package d3d11.enumerations;

enum abstract D3d11ColorWriteEnable(Int) to Int
{
    var Red   = 1;
    var Green = 2;
    var Blue  = 4;
    var Alpha = 8;
    var All   = (((Red | Green) | Blue) | Alpha);
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_COLOR_WRITE_ENABLE')
extern class NativeD3D11ColorWriteEnable
{
    //
}
