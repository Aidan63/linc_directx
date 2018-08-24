package d3d11;

import com.IUnknown;
import cpp.Star;

typedef RenderTargetView = Star<RenderTargetViewRef>;

@:keep
@:unreflective
@:native("ID3D11RenderTargetView")
@:include("d3d11.h")
private extern class RenderTargetViewRef extends IUnknownRef
{
    //
}
