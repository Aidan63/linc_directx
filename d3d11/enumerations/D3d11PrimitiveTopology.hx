package d3d11.enumerations;

/**
 * How the pipeline interprets vertex data that is bound to the input-assembler stage.
 * These primitive topology values determine how the vertex data is rendered on screen.
 */
enum abstract D3d11PrimitiveTopology(Int) to Int
{
    /**
     * The IA stage has not been initialized with a primitive topology. The IA stage will not function properly unless a primitive topology is defined.
     */
    var Undefined = 0;

    /**
     * Interpret the vertex data as a list of points.
     */
    var PointList = 1;

    /**
     * Interpret the vertex data as a list of lines.
     */
    var LineList = 2;

    /**
     * Interpret the vertex data as a line strip.
     */
    var LineStrip = 3;

    /**
     * Interpret the vertex data as a list of triangles.
     */
    var TriangleList = 4;

    /**
     * Interpret the vertex data as a triangle strip.
     */
    var TriangleStrip = 5;

    /**
     * Interpret the vertex data as list of lines with adjacency data.
     */
    var LineListAdj = 10;

    /**
     * Interpret the vertex data as line strip with adjacency data.
     */
    var LineStripAdj = 11;

    /**
     * Interpret the vertex data as list of triangles with adjacency data.
     */
    var TriangleListAdj = 12;

    /**
     * Interpret the vertex data as triangle strip with adjacency data.
     */
    var TriangleStripAdj = 13;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_PRIMITIVE_TOPOLOGY')
extern class NativeD3D11PrimitiveTopology
{
    //
}
