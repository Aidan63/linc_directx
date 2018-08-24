package d3d.d3d11;

import com.IUnknown;
import cpp.Star;

typedef InputLayout = Star<InputLayoutRef>;

@:keep
@:unreflective
@:native("ID3D11InputLayout")
@:include("d3d11.h")
private extern class InputLayoutRef extends IUnknownRef
{
    //
}
