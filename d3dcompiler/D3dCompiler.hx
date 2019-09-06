package d3dcompiler;

import cpp.Pointer;
import cpp.ConstCharStar;
import cpp.SizeT;
import cpp.Star;
import haxe.io.BytesData;
import d3dcommon.structures.D3dShaderMacro;
import d3dcommon.interfaces.D3dInclude;
import d3dcommon.interfaces.D3dBlob;

using cpp.Native;

class D3dCompiler
{
    public static function compile(
        _data : BytesData,
        _sourceName : Null<String>,
        _defines : Null<Array<D3dShaderMacro>>,
        _include : Null<D3dInclude>,
        _entryPoint : Null<String>,
        _target : String,
        _flags1 : Int,
        _flags2 : Int,
        _code : D3dBlob,
        _errors : Null<D3dBlob>
    ) : Int
    {
        return NativeD3DCompiler.compile(
            (Pointer.arrayElem(_data, 0).reinterpret() : Pointer<cpp.Void>).ptr,
            _data.length,
            _sourceName,
            null,
            _include == null ? null : (cast _include.ptr : Star<NativeID3DInclude>),
            _entryPoint,
            _target,
            _flags1,
            _flags2,
            (cast _code.ptr.addressOf() : Star<Star<NativeID3DBlob>>),
            _errors == null ? null : (cast _errors.ptr.addressOf() : Star<Star<NativeID3DBlob>>)
        );
    }

    /**
     * Creates a buffer.
     * @param _size Number of bytes in the blob.
     * @param _blob The address of a pointer to the `ID3DBlob` interface that is used to retrieve the buffer.
     * @return Returns one of the Direct3D 11 return codes.
     */
    public static function createBlob(_size : Int, _blob : D3dBlob) : Int
    {
        return NativeD3DCompiler.createBlob(_size, (cast _blob.ptr.addressOf() : Star<Star<NativeID3DBlob>>));
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3dcompiler.h')
extern class NativeD3DCompiler
{
    @:native('D3DCompile')
    static function compile(
        _sourceData : Star<cpp.Void>,
        _sourceDataSize : SizeT,
        _sourceName : ConstCharStar,
        _defines : Star<NativeD3DShaderMacro>,
        _include : Star<NativeID3DInclude>,
        _entryPoint : ConstCharStar,
        _target : ConstCharStar,
        _flags1 : cpp.UInt32,
        _flags2 : cpp.UInt32,
        _code : Star<Star<NativeID3DBlob>>,
        _errors : Star<Star<NativeID3DBlob>>
    ) : Int;

    @:native('D3DCreateBlob')
    static function createBlob(_size : SizeT, _blob : Star<Star<NativeID3DBlob>>) : Int;
}
