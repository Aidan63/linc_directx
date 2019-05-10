package dxgi;

import dxgi.DXGI.DXGI_SWAP_EFFECT;

@:unreflective
@:structAccess
@:native('DXGI_SWAP_CHAIN_DESC')
@:include('dxgi.h')
extern class SwapChainDescription
{
    @:native('DXGI_SWAP_CHAIN_DESC')
    static function create() : SwapChainDescription;

    @:native('BufferDesc')
    var bufferDescription : ModeDescription;

    @:native('SampleDesc')
    var sampleDescription : SampleDescription;

    @:native('BufferUsage')
    var bufferUsage : cpp.UInt64;

    @:native('BufferCount')
    var bufferCount : Int;

    @:native('OutputWindow')
    var outputWindow : com.HWND;

    @:native('Windowed')
    var windowed : Bool;

    @:native('SwapEffect')
    var swapEffect : DXGI_SWAP_EFFECT;

    @:native('Flags')
    var flags : Int;
}
