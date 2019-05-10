package d3d11;

import com.IUnknown;
import cpp.Star;

typedef ClassLinkage = Star<ClassLinkageRef>;

@:keep
@:unreflective
@:native("ID3D11ClassLinkage")
@:include("d3d11.h")
private extern class ClassLinkageRef extends IUnknownRef
{
    //
}
