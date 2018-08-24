package d3d11;

import com.IUnknown;
import cpp.Star;

typedef RasterizerState = Star<RasterizerStateRef>;

@:keep
@:unreflective
@:native("ID3D11RasterizerState")
@:include("d3d11.h")
private extern class RasterizerStateRef extends IUnknownRef
{
    //
}
