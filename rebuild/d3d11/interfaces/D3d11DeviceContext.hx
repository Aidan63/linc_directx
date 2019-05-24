package d3d11.interfaces;

import cpp.Star;
import com.GUID;
import com.Unknown;
import d3d11.enumerations.D3d11Map;
import d3d11.structures.D3d11MappedSubResource;
import d3d11.interfaces.D3d11Resourse;
import d3d11.constants.D3d11Error;

class D3d11DeviceContext extends Unknown
{
    /**
     * Gets a pointer to the data contained in a subresource, and denies the GPU access to that subresource.
     * @param _resource A pointer to a `ID3D11Resource` interface.
     * @param _subresource Index number of the subresource.
     * @param _mapType A `D3D11_MAP`-typed value that specifies the CPU's read and write permissions for a resource.
     * @param _mapFlags Flag that specifies what the CPU does when the GPU is busy. This flag is optional.
     * @param _mappedResource A pointer to the `D3D11_MAPPED_SUBRESOURCE` structure for the mapped subresource. See the Remarks section regarding NULL pointers.
     * @return D3d11Error
     */
    public function map(_resource : D3d11Resource, _subresource : Int, _mapType : D3d11Map, _mapFlags : Int, _mappedResource : D3d11MappedSubResource) : D3d11Error
    {
        return (cast ptr : Star<NativeID3D11DeviceContext>).map(cast _resource.ptr, _subresource, cast _mapType, _mapFlags, _mappedResource.backing);
    }

    /**
     * Invalidate the pointer to a resource and reenable the GPU's access to that resource.
     * @param _resource A pointer to a `ID3D11Resource` interface.
     * @param _subresource A subresource to be unmapped.
     */
    public function unmap(_resource : D3d11Resource, _subresource : Int)
    {
        return (cast ptr : Star<NativeID3D11DeviceContext>).unmap(cast _resource.ptr, _subresource);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11DeviceContext')
extern class NativeID3D11DeviceContext extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11DeviceContext)');
    }

    @:native('Map')
    function map(_resource : Star<NativeID3D11Resource>, _subresource : cpp.UInt32, _mapType : NativeD3D11Map, _mapFlags : cpp.UInt32, _mappedSubresource : Star<NativeD3D11MappedSubResource>) : Int;

    @:native('Unmap')
    function unmap(_resource : Star<NativeID3D11Resource>, _subresource : cpp.UInt32) : Void;
}
