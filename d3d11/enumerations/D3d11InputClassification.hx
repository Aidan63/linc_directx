package d3d11.enumerations;

/**
 * Type of data contained in an input slot.
 */
enum abstract D3d11InputClassification(Int) to Int
{
    /**
     * Input data is per-vertex data.
     */
    var PerVertexData = 0;

    /**
     * Input data is per-instance data.
     */
    var PerInstanceData = 1;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_INPUT_CLASSIFICATION')
extern class NativeD3D11InputClassification
{
    //
}
