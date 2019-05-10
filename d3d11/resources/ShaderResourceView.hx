package d3d11.resources;

import d3d11.resources.Resource;
import com.IUnknown;
import cpp.Star;

typedef ShaderResourceView = Star<ShaderResourceViewRef>;

@:keep
@:unreflective
@:native("ID3D11ShaderResourceView")
@:include("d3d11.h")
private extern class ShaderResourceViewRef extends ResourceRef
{
    //
}
