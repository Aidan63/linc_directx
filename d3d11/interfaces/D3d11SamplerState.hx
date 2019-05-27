package d3d11.interfaces;

import com.GUID;
import cpp.Star;
import com.Unknown;
import d3d11.structures.D3d11SamplerDescription;

/**
 * The sampler-state interface holds a description for sampler state that you can bind to any shader stage of the pipeline for reference by texture sample operations.
 */
class D3d11SamplerState extends Unknown
{
    /**
     * Gets the description for sampler state that you used to create the sampler-state object.
     * @param _description A pointer to a `D3D11_SAMPLER_DESC` structure that receives a description of the sampler state.
     */
    public function getDescription(_description : D3d11SamplerDescription)
    {
        (cast ptr : Star<NativeID3D11SamplerState>).getDescription(_description.backing);
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('ID3D11SamplerState')
extern class NativeID3D11SamplerState extends NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(ID3D11SamplerState)');
    }

    @:native('GetDesc')
    function getDescription(_description : Star<NativeD3D11SamplerDescription>) : Void;
}
