package d3d11.enumerations;

enum abstract D3d11Filter(Int) to Int
{
    var MinMagMipPoint = 0;
    var MinMagPointMipLinear = 0x1;
    var MinPointMagLinearMipPoint = 0x4;
    var MinPointMagMipLinear = 0x5;
    var MinLinearMagMipPoint = 0x10;
    var MinLinearMagPointMipLinear = 0x11;
    var MinMagLinearMipPoint = 0x14;
    var MinMagMipLinear = 0x15;
    var Anisotropic = 0x55;
    var ComparisonMinMagMipPoint = 0x80;
    var ComparisonMinMagPointMipLinear = 0x81;
    var ComparisonMinPointMagLinearMipPoint = 0x84;
    var ComparisonMinPointMagMipLinear = 0x85;
    var ComparisonMinLinearMagMipPoint = 0x90;
    var ComparisonMinLinearMagPointMipLinear = 0x91;
    var ComparisonMinMagLinearMipPoint = 0x94;
    var ComparisonMinMagMipLinear = 0x95;
    var ComparisonAnisotropic = 0xd5;
    var MinimumMinMagMipPoint = 0x100;
    var MinimumMinMagPointMipLinear = 0x101;
    var MinimumMinPointMagLinearMipPoint = 0x104;
    var MinimumMinPointMagMipLinear = 0x105;
    var MinimumMinLinearMagMipPoint = 0x110;
    var MinimumMinLinearMagPointMipLinear = 0x111;
    var MinimumMinMagLinearMipPoint = 0x114;
    var MinimumMinMagMipLinear = 0x115;
    var MinimumAnisotropic = 0x155;
    var MaximumMinMagMipPoint = 0x180;
    var MaximumMinMagPointMipLinear = 0x181;
    var MaximumMinPointMagLinearMipPoint = 0x184;
    var MaximumMinPointMagMipLinear = 0x185;
    var MaximumMinLinearMagMipPoint = 0x190;
    var MaximumMinLinearMagPointMipLinear = 0x191;
    var MaximumMinMagLinearMipPoint = 0x194;
    var MaximumMinMagMipLinear = 0x195;
    var MaximumAnisotropic = 0x1d;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_FILTER')
extern class NativeD3D11Filter
{
    //
}
