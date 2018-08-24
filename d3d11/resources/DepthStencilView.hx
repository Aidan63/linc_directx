package d3d11.resources;

import d3d11.resources.Resource;
import com.IUnknown;
import cpp.Star;

typedef DepthStencilView = Star<DepthStencilViewRef>;

@:unreflective
@:native("ID3D11DepthStencilView")
@:include("d3d11.h")
extern class DepthStencilViewRef extends ResourceRef
{
    //
}
