package d3d.compiler;

@:include("D3Dcompiler.h")
class D3DCompiler
{
    public static function compileFromFile(_filename : String, _entryPoint : String, _target : String, _btyecodeOut : Blob, _errors : Blob) : Int
    {
        return untyped __cpp__('D3DCompileFromFile({0}.__WCStr(), NULL, NULL, {1}, {2}, 0, 0, (ID3DBlob**)&{3}, (ID3DBlob**)&{4})', _filename, _entryPoint, _target, _btyecodeOut, _errors);
    }

    public static function compile(_data : String, _entryPoint : String, _target : String, _btyecodeOut : Blob, _errors : Blob) : Int
    {
        return untyped __cpp__('D3DCompile({0}.c_str(), {1}, NULL, NULL, NULL, {2}, {3}, 0, 0, (ID3DBlob**)&{4}, (ID3DBlob**)&{5})', _data, _data.length, _entryPoint, _target, _btyecodeOut, _errors);
    }
}
