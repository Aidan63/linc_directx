package d3d.compiler;

import com.IUnknown;

@:include("D3Dcompiler.h")
@:native("::cpp::Pointer<ID3DBlob>")
extern class Blob extends IUnknown
{
    inline function getBufferPointer() : cpp.Pointer<cpp.Void>
    {
        return cast untyped __cpp__('{0}->ptr->GetBufferPointer()', this);
    }

    inline function getBufferSize() : cpp.SizeT
    {
        return untyped __cpp__('{0}->ptr->GetBufferSize()', this);
    }
}
