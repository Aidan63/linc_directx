package d3d11.enumerations;

/**
 * Identifies expected resource use during rendering.
 * The usage directly reflects whether a resource is accessible by the CPU and/or the graphics processing unit (GPU).
 */
enum abstract D3d11Usage(Int) to Int
{
    /**
     * A resource that requires read and write access by the GPU. This is likely to be the most common usage choice.
     */
    var Default = 0;

    /**
     * A resource that can only be read by the GPU. It cannot be written by the GPU, and cannot be accessed at all by the CPU.
     * This type of resource must be initialized when it is created, since it cannot be changed after creation.
     */
    var Immutable = 1;

    /**
     * A resource that is accessible by both the GPU (read only) and the CPU (write only).
     * A dynamic resource is a good choice for a resource that will be updated by the CPU at least once per frame. To update a dynamic resource, use a Map method.
     */
    var Dynamic = 2;

    /**
     * A resource that supports data transfer (copy) from the GPU to the CPU.
     */
    var Staging = 3;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_USAGE')
extern class NativeD3D11Usage
{
    //
}
