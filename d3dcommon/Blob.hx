package d3dcommon;

import com.IUnknown;
import cpp.Star;
import cpp.SizeT;

typedef Blob = Star<BlobRef>;

@:unreflective
@:structAccess
@:include("D3Dcommon.h")
@:native("ID3DBlob")
extern class BlobRef extends IUnknownRef
{
    @:native('GetBufferPointer')
    function getBufferPointer() : cpp.Star<cpp.Void>;

    @:native('GetBufferSize')
    function getBufferSize() : cpp.SizeT;
}
