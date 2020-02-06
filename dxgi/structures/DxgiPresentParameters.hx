package dxgi.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Pointer;
import cpp.Star;

class DxgiPresentParameters
{
    public final backing : Star<NativeDXGIPresentParameters>;

    public var dirtyRectsCount (get, set) : Int;

    inline function get_dirtyRectsCount() : Int return backing.dirtyRectsCount;

    inline function set_dirtyRectsCount(_v : Int) : Int return backing.dirtyRectsCount = _v;

    public function new(_existing : Pointer<NativeDXGIPresentParameters> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGIPresentParameters.createPtr();

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : DxgiPresentParameters)
    {
        Pointer.fromStar(_obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi1_2.h')
@:native('DXGI_PRESENT_PARAMETERS')
extern class NativeDXGIPresentParameters
{
    @:native('DXGI_PRESENT_PARAMETERS')
    static function createRef() : NativeDXGIPresentParameters;

    @:native('new DXGI_PRESENT_PARAMETERS')
    static function createPtr() : Star<NativeDXGIPresentParameters>;

    @:native('DirtyRectsCount')
    var dirtyRectsCount : cpp.UInt32;
}