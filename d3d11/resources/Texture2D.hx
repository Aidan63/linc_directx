package d3d11.resources;

import d3d11.resources.Resource;
import com.IUnknown;
import cpp.Star;

typedef Texture2D = Star<Texture2DRef>;

@:keep
@:unreflective
@:native("ID3D11Texture2D")
@:include("d3d11.h")
extern class Texture2DRef extends ResourceRef
{
    //
}
