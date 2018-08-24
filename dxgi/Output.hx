package dxgi;

import com.IUnknown;
import cpp.Star;

typedef Output = Star<OutputRef>;

@:keep
@:unreflective
@:structAccess
@:native("IDXGIOutput")
@:include("dxgi.h")
private extern class OutputRef extends IUnknownRef
{
    //
}
