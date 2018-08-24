package d3d.d3d11;

import com.IUnknown;
import cpp.Star;

typedef SamplerState = Star<SamplerStateRef>;

@:keep
@:unreflective
@:native("ID3D11SamplerState")
@:include("d3d11.h")
private extern class SamplerStateRef extends IUnknownRef
{
    //
}
