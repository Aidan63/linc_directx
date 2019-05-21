package d3d11.enumerations;

/**
 * Identifies how to bind a resource to the pipeline.
 */
enum abstract D3d11BindFlag(Int) from Int to Int
{
    /**
     * Bind a buffer as a vertex buffer to the input-assembler stage.
     */
    var VertexBuffer = 0x1;
    
    /**
     * Bind a buffer as an index buffer to the input-assembler stage.
     */
    var IndexBuffer = 0x2;

    /**
     * Bind a buffer as a constant buffer to a shader stage; this flag may NOT be combined with any other bind flag.
     */
    var ConstantBuffer = 0x4;

    /**
     * Bind a buffer or texture to a shader stage; this flag cannot be used with the `D3D11_MAP_WRITE_NO_OVERWRITE` flag.
     */
    var ShaderResource = 0x8;

    /**
     * Bind an output buffer for the stream-output stage.
     */
    var StreamOutput = 0x10;

    /**
     * Bind a texture as a render target for the output-merger stage.
     */
    var RenderTarget = 0x20;

    /**
     * Bind a texture as a depth-stencil target for the output-merger stage.
     */
    var DepthStencil = 0x40;

    /**
     * Bind an unordered access resource.
     */
    var UnorderedAccess = 0x80;

    /**
     * Set this flag to indicate that a 2D texture is used to receive output from the decoder API.
     * The common way to create resources for a decoder output is by calling the `ID3D11Device::CreateTexture2D` method to create an array of 2D textures.
     * However, you cannot use texture arrays that are created with this flag in calls to `ID3D11Device::CreateShaderResourceView`.
     * 
     * Direct3D 11:  This value is not supported until Direct3D 11.1.
     */
    var Decoder = 0x200;

    /**
     * Set this flag to indicate that a 2D texture is used to receive input from the video encoder API.
     * The common way to create resources for a video encoder is by calling the `ID3D11Device::CreateTexture2D` method to create an array of 2D textures.
     * However, you cannot use texture arrays that are created with this flag in calls to `ID3D11Device::CreateShaderResourceView`.
     * 
     * Direct3D 11:  This value is not supported until Direct3D 11.1.
     */
    var VideoEncoder = 0x400;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_BIND_FLAG')
extern class NativeD3D11BindFlag
{
    //
}
