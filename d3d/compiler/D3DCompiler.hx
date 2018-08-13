package d3d.compiler;

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
}
