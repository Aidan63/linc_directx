package d3dcommon.interfaces;

import cpp.Star;
import cpp.Pointer;
import cpp.ConstPointer;
import cpp.ConstCharStar;
import com.Unknown;
import com.LPCVOID;
import d3dcommon.enumerations.D3dIncludeType;

using cpp.Native;

/**
 * `ID3DInclude` is an include interface that the user implements to allow an application to call user-overridable methods for opening and closing shader #include files.
 */
class D3dInclude extends Unknown
{
    /**
     * A user-implemented method for opening and reading the contents of a shader #include file.
     * @param _includeType A `D3D_INCLUDE_TYPE`-typed value that indicates the location of the #include file.
     * @param _filename Name of the #include file.
     * @param _parentData Pointer to the container that includes the #include file. The compiler might pass NULL in pParentData.
     * For more information, see the "Searching for Include Files" section in Compile an Effect (Direct3D 11).
     * @param _data Pointer to the buffer that contains the include directives. This pointer remains valid until you call `ID3DInclude::Close`.
     * @param _bytes Pointer to the number of bytes that Open returns in ppData.
     * @return The user-implemented method must return `S_OK`.
     * If Open fails when it reads the #include file, the application programming interface (API) that caused Open to be called fails. This failure can occur in one of the following situations:
     * - The high-level shader language (HLSL) shader fails one of the `D3D10CompileShader***` functions.
     * - The effect fails one of the `D3D10CreateEffect***` functions.
     */
    public function open(_includeType : D3dIncludeType, _filename : String, _parentData : ConstPointer<cpp.Void>, _data : ConstPointer<cpp.Void>, _bytes : Array<Int>) : Int
    {
        return (cast ptr : Star<NativeID3DInclude>).open(cast _includeType, _filename, _parentData.ptr, cast _data.ptr.addressOf(), cast Pointer.arrayElem(_bytes, 0).ptr);
    }

    /**
     * A user-implemented method for closing a shader #include file.
     * @param _data Pointer to the buffer that contains the include directives. This is the pointer that was returned by the corresponding `ID3DInclude::Open` call.
     * @return The user-implemented Close method should return `S_OK`. If Close fails when it closes the #include file, the application programming interface (API) that caused Close to be called fails.
     * This failure can occur in one of the following situations:
     * - The high-level shader language (HLSL) shader fails one of the `D3D10CompileShader***` functions.
     * - The effect fails one of the `D3D10CreateEffect***` functions.
     */
    public function close(_data : ConstPointer<cpp.Void>) : Int
    {
        return (cast ptr : Star<NativeID3DInclude>).close(_data.ptr);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3dcommon.h')
@:native('ID3DInclude')
extern class NativeID3DInclude extends NativeIUnknown
{
    @:native('Open')
    function open(_includeType : NativeD3DIncludeType, _filename : ConstCharStar, _parentData : Star<cpp.Void>, _data : Star<LPCVOID>, _bytes : Star<cpp.UInt32>) : cpp.UInt32;

    @:native('Close')
    function close(_data : Star<cpp.Void>) : cpp.UInt32;
}
