package dxgi;

import dxgi.DXGI.DXGI_FORMAT;

@:unreflective
@:structAccess
@:native('DXGI_MODE_DESC')
@:include('dxgi.h')
extern class ModeDescription
{
    @:native('DXGI_MODE_DESC')
    static function create() : ModeDescription;

    @:native('Width')
    var width : Int;

    @:native('Height')
    var height : Int;

    @:native('RefreshRate')
    var refreshRate : Rational;

    @:native('Format')
    var format : DXGI_FORMAT;

    @:native('ScanlineOrdering')
    var scanlineOrdering : Int;

    @:native('Scaling')
    var Scaling : Int;
}
