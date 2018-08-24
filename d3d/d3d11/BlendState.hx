package d3d.d3d11;

import com.IUnknown;
import cpp.Star;

typedef BlendState = Star<BlendStateRef>;

@:unreflective
@:native("ID3D11BlendState")
@:include("d3d11.h")
private extern class BlendStateRef extends IUnknownRef
{
    //
}
