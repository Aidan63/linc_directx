package dxgi.constants;

enum abstract DxgiUsage(Int) from Int to Int
{
    /**
     * The surface or resource is used as a back buffer.
     * You don’t need to pass `DXGI_USAGE_BACK_BUFFER` when you create a swap chain.
     * But you can determine whether a resource belongs to a swap chain when you call `IDXGIResource::GetUsage` and get `DXGI_USAGE_BACK_BUFFER`.
     */
    var BackBuffer = 1 << (2 + 4);

    /**
     * This flag is for internal use only.
     */
    var DiscardOnPresent = 1 << (5 + 4);

    /**
     * Use the surface or resource for reading only.
     */
    var ReadOnly = 1 << (4 + 4);

    /**
     * Use the surface or resource as an output render target.
     */
    var RenderTargetOutput = 1 << (1 + 4);

    /**
     * Use the surface or resource as an input to a shader.
     */
    var ShaderInput = 1 << (0 + 4);

    /**
     * Share the surface or resource.
     */
    var Shared = 1 << (3 + 4);

    /**
     * Use the surface or resource for unordered access.
     */
    var UnorderedAccess = 1 << (6 + 4);
}