package d3dcommon.enumerations;

/**
 * Values that indicate the location of a shader #include file.
 */
enum abstract D3dIncludeType(Int) to Int
{
    /**
     * The local directory.
     */
    var Local = 0;
    
    /**
     * The system directory.
     */
    var System = (Local + 1);

    /**
     * The local directory.
     */
    var D3d10Local = Local;

    /**
     * The system directory.
     */
    var D3d10System = System;

    /**
     * Forces this enumeration to compile to 32 bits in size.
     * Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits.
     * 
     * Do not use this value.
     */
    var ForceDWord = 0x7fffffff;
}

@:keep
@:unreflective
@:structAccess
@:include('d3dcommon.h')
@:native('D3D_INCLUDE_TYPE')
extern class NativeD3DIncludeType
{
    //
}
