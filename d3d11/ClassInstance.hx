package d3d11;

import com.IUnknown;
import cpp.Star;

typedef ClassInstance = Star<ClassInstanceRef>;

@:keep
@:unreflective
@:native("ID3D11ClassInstance")
@:include("d3d11.h")
private extern class ClassInstanceRef extends IUnknownRef
{
    //
}
