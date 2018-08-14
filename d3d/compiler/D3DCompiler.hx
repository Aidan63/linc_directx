package d3d.compiler;

import haxe.io.Bytes;

@:include("D3Dcompiler.h")
extern class D3DCompiler
{
    inline static function compileFromFile(_filename : String, _entryPoint : String, _target : String, _btyecodeOut : Blob, _errors : Blob) : Int
    {
        return untyped __cpp__('D3DCompileFromFile(
            {0}.__WCStr(),
            0,
            0,
            {1},
            {2},
            0,
            0,
            (ID3DBlob**)&{3},
            (ID3DBlob**)&{4})', _filename, _entryPoint, _target, _btyecodeOut, _errors);
    }

    inline static function compile(_data : Bytes, _entryPoint : String, _target : String, _btyecodeOut : Blob, _errors : Blob)
    {
        return untyped __cpp__('D3DCompile(
            (const void *)&({0}[0]),
            {1},
            0,
            0,
            0,
            {2},
            {3},
            0,
            0,
            (ID3D11Blob**)&{4},
            (ID3D11Blob**)&{5}
        )', _data.getData(), _data.length, _entryPoint, _target, _btyecodeOut, _errors);
    }
}
