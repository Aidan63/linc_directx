package d3d.d3d11;

import com.IUnknown;
import cpp.Star;

typedef ShaderResourceView = Star<ShaderResourceViewRef>;

@:keep
@:unreflective
@:native("ID3D11ShaderResourceView")
@:include("d3d11.h")
private extern class ShaderResourceViewRef extends IUnknownRef
{
    //
}
