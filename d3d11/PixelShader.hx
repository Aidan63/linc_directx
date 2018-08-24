package d3d11;

import com.IUnknown;
import cpp.Star;

typedef PixelShader = Star<PixelShaderRef>;

@:keep
@:unreflective
@:native("ID3D11PixelShader")
@:include("d3d11.h")
private extern class PixelShaderRef extends IUnknownRef
{
    //
}
