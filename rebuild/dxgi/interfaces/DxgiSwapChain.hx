package dxgi.interfaces;

import cpp.Pointer;
import cpp.Star;
import com.GUID;
import com.Unknown;
import dxgi.constants.DxgiError;
import dxgi.constants.DxgiPresent;
import dxgi.interfaces.DxgiObject;
import dxgi.interfaces.DxgiOutput;
import dxgi.structures.DxgiSwapChainDescription;
import dxgi.structures.DxgiModeDescription;
import dxgi.structures.DxgiFrameStatistics;
import dxgi.enumerations.DxgiSwapEffect;
import dxgi.enumerations.DxgiFormat;
import dxgi.enumerations.DxgiSwapChainFlag;

using cpp.Native;

/**
 * An IDXGISwapChain interface implements one or more surfaces for storing rendered data before presenting it to an output.
 */
class DxgiSwapChain extends DxgiObject
{
    /**
     * Accesses one of the swap-chain's back buffers.
     * @param _buffer A zero-based buffer index.
     * If the swap chain's swap effect is `DXGI_SWAP_EFFECT_DISCARD`, this method can only access the first buffer; for this situation, set the index to zero.
     * If the swap chain's swap effect is either `DXGI_SWAP_EFFECT_SEQUENTIAL` or `DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL`, only the swap chain's zero-index buffer can be read from and written to.
     * The swap chain's buffers with indexes greater than zero can only be read from; so if you call the `IDXGIResource::GetUsage` method for such buffers, they have the `DXGI_USAGE_READ_ONLY` flag set.
     * @param _riid The type of interface used to manipulate the buffer.
     * @param _surface A pointer to a back-buffer interface.
     * @return DxgiError
     */
    public function getBuffer(_buffer : Int, _riid : GUID, _surface : Unknown) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).getBuffer(_buffer, _riid, cast _surface.ptr.addressOf());
    }

    /**
     * Get the output (the display monitor) that contains the majority of the client area of the target window.
     * @param _output A pointer to the output interface (see `IDXGIOutput`).
     * @return DxgiError
     */
    public function getContainingOutput(_output : DxgiOutput) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).getContainingOutput(cast _output.ptr.addressOf());
    }

    /**
     * [Starting with Direct3D 11.1, we recommend not to use `GetDesc` anymore to get a description of the swap chain. Instead, use `IDXGISwapChain1::GetDesc1`.]
     * 
     * Get a description of the swap chain.
     * @param _description A pointer to the swap-chain description (see `DXGI_SWAP_CHAIN_DESC`).
     * @return DxgiError
     */
    public function getDescription(_description : DxgiSwapChainDescription) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).getDescription(_description.backing);
    }

    /**
     * Gets performance statistics about the last render frame.
     * @param _stats A pointer to a `DXGI_FRAME_STATISTICS` structure for the frame statistics.
     * @return DxgiError
     */
    public function getFrameStatistics(_stats : DxgiFrameStatistics) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).getFrameStatistics(_stats.backing);
    }

    /**
     * Get the state associated with full-screen mode.
     * @param _fullscreen A pointer to a boolean whose value is either:
     * - TRUE if the swap chain is in full-screen mode.
     * - FALSE if the swap chain is in windowed mode.
     * @param _target A pointer to the output target (see `IDXGIOutput`) when the mode is full screen; otherwise NULL.
     * @return DxgiError
     */
    public function getFullscreenState(_fullscreen : Array<Bool>, _target) : DxgiError
    {
        if (_fullscreen.length < 1)
        {
            return InvalidCall;
        }

        return (cast ptr : Star<NativeIDXGISwapChain>).getFullscreenState(Pointer.arrayElem(_fullscreen, 0).ptr, cast _target.ptr.addressOf());
    }

    /**
     * Gets the number of times that `IDXGISwapChain::Present` or `IDXGISwapChain1::Present1` has been called.
     * @param _lastPresentCount A pointer to a variable that receives the number of calls.
     * @return DxgiError
     */
    public function getLastPresentCount(_lastPresentCount : Array<Int>) : DxgiError
    {
        if (_lastPresentCount.length < 1)
        {
            return InvalidCall;
        }

        return (cast ptr : Star<NativeIDXGISwapChain>).getLastPresentCount(Pointer.arrayElem(_lastPresentCount, 0).ptr);
    }

    /**
     * Presents a rendered image to the user.
     * @param _syncInterval An integer that specifies how to synchronize presentation of a frame with the vertical blank.
     * 
     * For the bit-block transfer (bitblt) model (`DXGI_SWAP_EFFECT_DISCARD` or `DXGI_SWAP_EFFECT_SEQUENTIAL`), values are:
     * - 0 - The presentation occurs immediately, there is no synchronization.
     * - 1 through 4 - Synchronize presentation after the nth vertical blank.
     * 
     * For the flip model (`DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL`), values are:
     * - 0 - Cancel the remaining time on the previously presented frame and discard this frame if a newer frame is queued.
     * - 1 through 4 - Synchronize presentation for at least n vertical blanks.
     * For an example that shows how sync-interval values affect a flip presentation queue, see Remarks.
     * 
     * If the update region straddles more than one output (each represented by `IDXGIOutput`), Present performs the synchronization to the output that contains the largest sub-rectangle of the target window's client area.
     * @param _flags An integer value that contains swap-chain presentation options. These options are defined by the `DXGI_PRESENT` constants.
     * @return Possible return values include: `S_OK`, `DXGI_ERROR_DEVICE_RESET` or `DXGI_ERROR_DEVICE_REMOVED` (see `DXGI_ERROR`), `DXGI_STATUS_OCCLUDED` (see `DXGI_STATUS`), or `D3DDDIERR_DEVICEREMOVED`.
     * Note : The Present method can return either `DXGI_ERROR_DEVICE_REMOVED` or `D3DDDIERR_DEVICEREMOVED` if a video card has been physically removed from the computer, or a driver upgrade for the video card has occurred.
     */
    public function present(_syncInterval : DxgiSwapEffect, _flags : DxgiPresent) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).present(_syncInterval, _flags);
    }

    /**
     * Changes the swap chain's back buffer size, format, and number of buffers. This should be called when the application window is resized.
     * @param _bufferCount The number of buffers in the swap chain (including all back and front buffers).
     * This number can be different from the number of buffers with which you created the swap chain. This number can't be greater than `DXGI_MAX_SWAP_CHAIN_BUFFERS`.
     * Set this number to zero to preserve the existing number of buffers in the swap chain. You can't specify less than two buffers for the flip presentation model.
     * @param _width The new width of the back buffer. If you specify zero, DXGI will use the width of the client area of the target window.
     * You can't specify the width as zero if you called the `IDXGIFactory2::CreateSwapChainForComposition` method to create the swap chain for a composition surface.
     * @param _height The new height of the back buffer. If you specify zero, DXGI will use the height of the client area of the target window.
     * You can't specify the height as zero if you called the `IDXGIFactory2::CreateSwapChainForComposition` method to create the swap chain for a composition surface.
     * @param _format A `DXGI_FORMAT`-typed value for the new format of the back buffer. Set this value to `DXGI_FORMAT_UNKNOWN` to preserve the existing format of the back buffer.
     * The flip presentation model supports a more restricted set of formats than the bit-block transfer (bitblt) model.
     * @param _flags A combination of `DXGI_SWAP_CHAIN_FLAG`-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for swap-chain behavior.
     * @return Returns `S_OK` if successful; an error code otherwise. For a list of error codes, see `DXGI_ERROR`.
     */
    public function resizeBuffers(_bufferCount : Int, _width : Int, _height : Int, _format : DxgiFormat, _flags : DxgiSwapChainFlag) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).resizeBuffers(_bufferCount, _width, _height, cast _format, _flags);
    }

    /**
     * Resizes the output target.
     * @param _newTargetParameters A pointer to a `DXGI_MODE_DESC` structure that describes the mode, which specifies the new width, height, format, and refresh rate of the target.
     * If the format is `DXGI_FORMAT_UNKNOWN`, ResizeTarget uses the existing format. We only recommend that you use `DXGI_FORMAT_UNKNOWN` when the swap chain is in full-screen mode as this method is not thread safe.
     * @return Returns a code that indicates success or failure. `DXGI_STATUS_MODE_CHANGE_IN_PROGRESS` is returned if a full-screen/windowed mode transition is occurring when this API is called.
     * See `DXGI_ERROR` for additional DXGI error codes.
     */
    public function resizeTarget(_newTargetParameters : DxgiModeDescription) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).resizeTarget(_newTargetParameters.backing);
    }

    /**
     * Sets the display state to windowed or full screen.
     * @param _fullscreen A Boolean value that specifies whether to set the display state to windowed or full screen. TRUE for full screen, and FALSE for windowed.
     * @param _target If you pass TRUE to the Fullscreen parameter to set the display state to full screen, you can optionally set this parameter to a pointer to an `IDXGIOutput` interface for the output target that contains the swap chain.
     * If you set this parameter to NULL, DXGI will choose the output based on the swap-chain's device and the output window's placement.
     * If you pass FALSE to Fullscreen, you must set this parameter to NULL.
     * @return This methods returns:
     * - `S_OK` if the action succeeded and the swap chain was placed in the requested state.
     * - `DXGI_ERROR_NOT_CURRENTLY_AVAILABLE` if the action failed. There are many reasons why a windowed-mode swap chain cannot switch to full-screen mode. For instance:
     *     - The application is running over Terminal Server.
     *     - The output window is occluded.
     *     - The output window does not have keyboard focus.
     *     - Another application is already in full-screen mode.
     * When this error is returned, an application can continue to run in windowed mode and try to switch to full-screen mode later.
     * - `DXGI_STATUS_MODE_CHANGE_IN_PROGRESS` is returned if a fullscreen/windowed mode transition is occurring when this API is called.
     * - Other error codes if you run out of memory or encounter another unexpected fault; these codes may be treated as hard, non-continuable errors.
     */
    public function setFullscreenState(_fullscreen : Bool, _target : DxgiOutput) : DxgiError
    {
        return (cast ptr : Star<NativeIDXGISwapChain>).setFullscreenState(_fullscreen, cast _target.ptr);
    }
}

@:keep
@:unreflective
@:structAccess
@:native("IDXGISwapChain")
@:include("dxgi.h")
extern class NativeIDXGISwapChain extends NativeIDXGIObject
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IDXGISwapChain)');
    }

    @:native('GetBuffer')
    function getBuffer(_buffer : cpp.UInt32, _riid : GUID, _surface : Star<Star<cpp.Void>>) : Int;

    @:native('GetContainingOutput')
    function getContainingOutput(_output : Star<Star<NativeIDXGIOutput>>) : Int;

    @:native('GetDescription')
    function getDescription(_description : Star<NativeDXGISwapChainDescription>) : Int;

    @:native('GetFrameStatistics')
    function getFrameStatistics(_stats : Star<NativeDXGIFrameStatistics>) : Int;

    @:native('GetFullscreenState')
    function getFullscreenState(_fullscreen : Star<Bool>, _target : Star<Star<NativeIDXGIOutput>>) : Int;

    @:native('GetLastPresentCount')
    function getLastPresentCount(_lastPresentCount : Star<cpp.UInt32>) : Int;

    @:native('Present')
    function present(_syncInterval : cpp.UInt32, _flags : cpp.UInt32) : Int;

    @:native('ResizeBuffers')
    function resizeBuffers(_bufferCount : cpp.UInt32, _width : cpp.UInt32, _height : cpp.UInt32, _format : NativeDXGIFormat, _flags : cpp.UInt32) : Int;

    @:native('ResizeTarget')
    function resizeTarget(_newTargetParameters : Star<NativeDXGIModeDescription>) : Int;

    @:native('SetFullscreenState')
    function setFullscreenState(_fullscreen : Bool, _target : Star<NativeIDXGIOutput>) : Int;
}
