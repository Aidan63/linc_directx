package d3d11.enumerations;

/**
 * Identifies a resource to be accessed for reading and writing by the CPU.
 * Applications may combine one or more of these flags.
 */
enum abstract D3d11Map(Int) to Int
{
    /**
     * Resource is mapped for reading. The resource must have been created with read access (see `D3D11_CPU_ACCESS_READ`).
     */
    var Read = 1;

    /**
     * Resource is mapped for writing. The resource must have been created with write access (see `D3D11_CPU_ACCESS_WRITE`).
     */
    var Write = 2;

    /**
     * Resource is mapped for reading and writing. The resource must have been created with read and write access (see `D3D11_CPU_ACCESS_READ` and `D3D11_CPU_ACCESS_WRITE`).
     */
    var ReadWrite = 3;

    /**
     * Resource is mapped for writing; the previous contents of the resource will be undefined.
     * The resource must have been created with write access and dynamic usage (See `D3D11_CPU_ACCESS_WRITE` and `D3D11_USAGE_DYNAMIC`).
     */
    var WriteDiscard = 4;

    /**
     * Resource is mapped for writing; the existing contents of the resource cannot be overwritten (see Remarks).
     * This flag is only valid on vertex and index buffers. The resource must have been created with write access (see `D3D11_CPU_ACCESS_WRITE`). Cannot be used on a resource created with the `D3D11_BIND_CONSTANT_BUFFER` flag.
     * 
     * Note : The Direct3D 11.1 runtime, which is available starting with Windows 8, enables mapping dynamic constant buffers and shader resource views (SRVs) of dynamic buffers with `D3D11_MAP_WRITE_NO_OVERWRITE`.
     * The Direct3D 11 and earlier runtimes limited mapping to vertex or index buffers.
     * To determine if a Direct3D device supports these features, call `ID3D11Device::CheckFeatureSupport` with `D3D11_FEATURE_D3D11_OPTIONS`.
     * CheckFeatureSupport fills members of a `D3D11_FEATURE_DATA_D3D11_OPTIONS` structure with the device's features. The relevant members here are `MapNoOverwriteOnDynamicConstantBuffer` and `MapNoOverwriteOnDynamicBufferSRV`.
     */
    var WriteNoOverwrite = 5;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_MAP')
extern class NativeD3D11Map
{
    //
}
