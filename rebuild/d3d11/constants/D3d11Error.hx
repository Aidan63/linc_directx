package d3d11.constants;

enum abstract D3d11Error(Int) from Int to Int
{
    /**
     * No error occurred.
     */
    var Ok = 0x0;

    /**
     * Alternate success value, indicating a successful but nonstandard completion (the precise meaning depends on context).
     */
    var False = 0x1;
    
    /**
     * The method call isn't implemented with the passed parameter combination.
     */
    var Fail = 0x80004005;

    /**
     * An invalid parameter was passed to the returning function.
     */
    var InvalidArgument = 0x80070057;

    /**
     * Direct3D could not allocate sufficient memory to complete the call.
     */
    var OutOfMemory = 0x8007000E;

    /**
     * The method call isn't implemented with the passed parameter combination.
     */
    var NotImplemented = 0x80004001;

    /**
     * There are too many unique instances of a particular type of state object.
     */
    var TooManyUniqueStateObjects = 0x887c0001;

    /**
     * The file was not found.
     */
    var FileNotFound = 0x887c0002;

    /**
     * There are too many unique instances of a particular type of view object.
     */
    var TooManyUniqueViewObjects = 0x887c0003;

    /**
     * The first call to `ID3D11DeviceContext::Map` after either `ID3D11Device::CreateDeferredContext` or `ID3D11DeviceContext::FinishCommandList` per Resource was not `D3D11_MAP_WRITE_DISCARD`.
     */
    var DeferredContextMapWithoutInitialDiscard = 0x887c0004;

    /**
     * The method call is invalid. For example, a method's parameter may not be a valid pointer.
     */
    var InvalidCall = 0x887a0001;
    
    /**
     * The previous blit operation that is transferring information to or from this surface is incomplete.
     */
    var WasStillDrawing = 0x887a000a;
}
