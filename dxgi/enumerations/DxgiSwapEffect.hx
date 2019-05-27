package dxgi.enumerations;

/**
 * Options for handling pixels in a display surface after calling `IDXGISwapChain1::Present1`.
 */
enum abstract DxgiSwapEffect(Int) to Int
{
    /**
     * Use this flag to specify the bit-block transfer (bitblt) model and to specify that DXGI discard the contents of the back buffer after you call `IDXGISwapChain1::Present1`.
     * This flag is valid for a swap chain with more than one back buffer, although, applications only have read and write access to buffer 0.
     * Use this flag to enable the display driver to select the most efficient presentation technique for the swap chain. 
     */
    var Discard;

    /**
     * Use this flag to specify the bitblt model and to specify that DXGI persist the contents of the back buffer after you call `IDXGISwapChain1::Present1`.
     * Use this option to present the contents of the swap chain in order, from the first buffer (buffer 0) to the last buffer.
     * This flag cannot be used with multisampling. 
     */
    var Sequential;

    /**
     * Use this flag to specify the flip presentation model and to specify that DXGI persist the contents of the back buffer after you call `IDXGISwapChain1::Present1`.
     * This flag cannot be used with multisampling. 
     */
    var FlipSequential;

    /**
     * Use this flag to specify the flip presentation model and to specify that DXGI discard the contents of the back buffer after you call `IDXGISwapChain1::Present1`.
     * This flag cannot be used with multisampling and partial presentation. See DXGI 1.4 Improvements. 
     */
    var FlipDiscard;
}

@:keep
@:unreflective
@:include('dxgi.h')
@:native('DXGI_SWAP_EFFECT')
extern class NativeDXGISwapEffect
{
    //
}
