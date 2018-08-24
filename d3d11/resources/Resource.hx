package d3d11.resources;

import d3d11.resources.Resource;
import com.IUnknown;
import cpp.Star;

typedef Resource = Star<ResourceRef>;

@:keep
@:unreflective
@:native("ID3D11Resource")
@:include("d3d11.h")
extern class ResourceRef extends IUnknownRef
{
    //
}
