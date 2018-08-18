package d3d.compiler;

import cpp.Star;

// D3DCOMPILER_STRIP_FLAGS

@:enum extern abstract D3DCOMPILER_STRIP_FLAGS(NATIVE_D3DCOMPILER_STRIP_FLAGS)
{
    @:native('D3DCOMPILER_STRIP_REFLECTION_DATA') var REFLECTION_DATA;
    @:native('D3DCOMPILER_STRIP_DEBUG_INFO') var DEBUG_INFO;
    @:native('D3DCOMPILER_STRIP_TEST_BLOBS') var TEST_BLOBS;
    @:native('D3DCOMPILER_STRIP_PRIVATE_DATA') var PRIVATE_DATA;
    @:native('D3DCOMPILER_STRIP_ROOT_SIGNATURE') var ROOT_SIGNATURE;
    @:native('D3DCOMPILER_STRIP_FORCE_DWORD') var FORCE_DWORD;
}

@:native('::cpp::Struct<D3DCOMPILER_STRIP_FLAGS, ::cpp::EnumHandler>')
private extern class NATIVE_D3DCOMPILER_STRIP_FLAGS {}

// D3D_BLOB_PART

@:enum extern abstract D3D_BLOB_PART(NATIVE_D3D_BLOB_PART)
{
    @:native('D3D_BLOB_INPUT_SIGNATURE_BLOB') var INPUT_SIGNATURE_BLOB;
    @:native('D3D_BLOB_OUTPUT_SIGNATURE_BLOB') var OUTPUT_SIGNATURE_BLOB;
    @:native('D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB') var INPUT_AND_OUTPUT_SIGNATURE_BLOB;
    @:native('D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB') var PATCH_CONSTANT_SIGNATURE_BLOB;
    @:native('D3D_BLOB_ALL_SIGNATURE_BLOB') var ALL_SIGNATURE_BLOB;
    @:native('D3D_BLOB_DEBUG_INFO') var DEBUG_INFO;
    @:native('D3D_BLOB_LEGACY_SHADER') var LEGACY_SHADER;
    @:native('D3D_BLOB_XNA_PREPASS_SHADER') var XNA_PREPASS_SHADER;
    @:native('D3D_BLOB_XNA_SHADER') var XNA_SHADER;
    @:native('D3D_BLOB_PDB') var PDB;
    @:native('D3D_BLOB_PRIVATE_DATA') var PRIVATE_DATA;
    @:native('D3D_BLOB_ROOT_SIGNATURE') var ROOT_SIGNATURE;
    @:native('D3D_BLOB_DEBUG_NAME') var DEBUG_NAME;
    @:native('D3D_BLOB_TEST_ALTERNATE_SHADER') var TEST_ALTERNATE_SHADER;
    @:native('D3D_BLOB_TEST_COMPILE_DETAILS') var TEST_COMPILE_DETAILS;
    @:native('D3D_BLOB_TEST_COMPILE_PERF') var TEST_COMPILE_PERF;
    @:native('D3D_BLOB_TEST_COMPILE_REPORT') var TEST_COMPILE_REPORT;
}

@:native('::cpp::Struct<D3D_BLOB_PART, ::cpp::EnumHandler>')
private extern class NATIVE_D3D_BLOB_PART {}

//

@:unreflective
@:include("D3Dcompiler.h")
extern class D3DCompiler
{
    inline static function compileFromFile(_filename : String, _entryPoint : String, _target : String, _btyecodeOut : Star<Blob>, _errors : Star<Blob>) : Int
    {
        return untyped __cpp__('D3DCompileFromFile({0}.__WCStr(), NULL, NULL, {1}, {2}, 0, 0, {3}, {4})', _filename, _entryPoint, _target, _btyecodeOut, _errors);
    }

    inline static function compile(_data : String, _entryPoint : String, _target : String, _btyecodeOut : Star<Blob>, _errors : Star<Blob>) : Int
    {
        return untyped __cpp__('D3DCompile({0}.c_str(), {1}, NULL, NULL, NULL, {2}, {3}, 0, 0, {4}, {5})', _data, _data.length, _entryPoint, _target, _btyecodeOut, _errors);
    }
}
