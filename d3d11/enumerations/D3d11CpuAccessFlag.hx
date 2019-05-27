package d3d11.enumerations;

/**
 * Specifies the types of CPU access allowed for a resource.
 */
enum abstract D3d11CpuAccessFlag(Int) to Int to Int
{
    /**
     * The resource is to be mappable so that the CPU can change its contents.
     * Resources created with this flag cannot be set as outputs of the pipeline and must be created with either dynamic or staging usage (see `D3D11_USAGE`).
     */
    var Write = 0x10000;

    /**
     * The resource is to be mappable so that the CPU can read its contents.
     * Resources created with this flag cannot be set as either inputs or outputs to the pipeline and must be created with staging usage (see `D3D11_USAGE`).
     */
    var Read = 0x20000;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_CPU_ACCESS_FLAG')
extern class NativeD3D11CPUAccessFlag
{
    //
}
