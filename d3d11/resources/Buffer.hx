package d3d11.resources;

import d3d11.resources.Resource;
import com.IUnknown;
import cpp.Star;

typedef Buffer = Star<BufferRef>;

@:unreflective
@:native("ID3D11Buffer")
@:include("d3d11.h")
extern class BufferRef extends ResourceRef
{
    //
}
