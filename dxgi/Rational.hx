package dxgi;

@:unreflective
@:structAccess
@:native('DXGI_RATIONAL')
@:include('dxgi.h')
extern class Rational
{
    @:native('DXGI_RATIONAL')
    static function create() : Rational;

    @:native('Numerator')
    var numerator : Int;

    @:native('Denominator')
    var denominator : Int;
}
