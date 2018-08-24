package d3d11;

import com.IUnknown;
import cpp.Star;

typedef VertexShader = Star<VertexShaderRef>;

@:keep
@:unreflective
@:native("ID3D11VertexShader")
@:include("d3d11.h")
private extern class VertexShaderRef extends IUnknownRef
{
    //
}
