package com;

import cpp.vm.Gc;
import cpp.Function;
import cpp.Star;
import cpp.UInt32;

class Unknown
{
    public final ptr : Star<NativeIUnknown>;

    public function new()
    {
        ptr = null;
        
        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    public function release()
    {
        ptr.release();
    }

    public function addRef() : Int
    {
        return ptr.addRef();
    }

    /**
     * Finaliser for our IUnknown wrapper. Will release the reference to the native pointer when the wrapper is collected.
     * @param _obj Object about to be collected.
     */
    @:void static function finalize(_obj : Unknown)
    {
        _obj.release();
    }
}

@:keep
@:unreflective
@:structAccess
@:native("IUnknown")
@:include("unknwn.h")
extern class NativeIUnknown
{
    inline static function uuid() : GUID
    {
        return untyped __cpp__('__uuidof(IUnknown)');
    }

    @:native('Release')
    function release() : Void;

    @:native('AddRef')
    function addRef() : UInt32;
}
