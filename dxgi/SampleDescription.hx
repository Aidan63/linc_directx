package dxgi;

@:unreflective
@:structAccess
@:native('DXGI_SAMPLE_DESC')
@:include('dxgi.h')
extern class SampleDescription
{
    @:native('DXGI_SAMPLE_DESC')
    static function create() : SampleDescription;

    @:native('Count')
    var count : Int;

    @:native('Quality')
    var quality : Int;
}
