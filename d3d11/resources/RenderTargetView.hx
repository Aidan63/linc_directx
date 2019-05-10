package d3d11.resources;

import d3d11.resources.Resource;
import com.IUnknown;
import cpp.Star;

typedef RenderTargetView = Star<RenderTargetViewRef>;

@:keep
@:unreflective
@:native("ID3D11RenderTargetView")
@:include("d3d11.h")
private extern class RenderTargetViewRef extends ResourceRef
{
    //
}
