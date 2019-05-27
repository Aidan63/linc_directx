package d3dcompiler.interfaces;

import cpp.Star;
import cpp.Pointer;
import cpp.SizeT;
import cpp.RawPointer;
import com.Unknown;

/**
 * This interface is used to return data of arbitrary length.
 */
class D3dBlob extends Unknown
{
    /**
     * Retrieves a pointer to the blob's data.
     * @return Returns a pointer to the blob's data.
     */
    public function getBufferPointer() : Pointer<cpp.Void>
    {
        return Pointer.fromRaw((cast ptr : Star<NativeID3DBlob>).getBufferPointer());
    }

    /**
     * Retrieves the size, in bytes, of the blob's data.
     * @return Returns the size of the blob's data, in bytes.
     */
    public function getBufferSize() : SizeT
    {
        return (cast ptr : Star<NativeID3DBlob>).getBufferSize();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('D3DCommon.h')
@:native('ID3DBlob')
extern class NativeID3DBlob extends NativeIUnknown
{
    @:native('GetBufferPointer')
    function getBufferPointer() : RawPointer<cpp.Void>;

    @:native('GetBufferSize')
    function getBufferSize() : SizeT;
}
