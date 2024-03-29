package com;

import haxe.Int64;
import cpp.vm.Gc;
import cpp.Function;
import cpp.Star;

using cpp.Native;

/**
 * Enables clients to get pointers to other interfaces on a given object through the `QueryInterface` method, and manage the existence of the object through the `AddRef` and `Release` methods.
 * All other COM interfaces are inherited, directly or indirectly, from `IUnknown`.
 * Therefore, the three methods in `IUnknown` are the first entries in the VTable for every interface.
 */
class Unknown
{
    /**
     * Pointer to the underlying IUnknown object.
     */
    public final ptr : Star<NativeIUnknown>;

    public function new()
    {
        ptr = null;
    }

    /**
     * Decrements the reference count for an interface on an object.
     * @return The method returns the new reference count. This value is intended to be used only for test purposes.
     */
    public function release() : Int64
    {
        return ptr.release();
    }

    /**
     * Increments the reference count for an interface on an object. This method should be called for every new copy of a pointer to an interface on an object.
     * @return The method returns the new reference count. This value is intended to be used only for test purposes.
     */
    public function addRef() : Int64
    {
        return ptr.addRef();
    }

    /**
     * Retrieves pointers to the supported interfaces on an object.
     * 
     * This method calls IUnknown::AddRef on the pointer it returns.
     * @param _riid TBD
     * @param _object TBD
     * @return This method returns `S_OK` if the interface is supported, and `E_NOINTERFACE` otherwise. If ppvObject is NULL, this method returns `E_POINTER`.
     */
    public function queryInterface(_riid : cpp.Struct<GUID>, _object : Unknown) : Int
    {
        return ptr.queryInterface(_riid, cast _object.ptr.addressOf());
    }
}

@:keep
@:unreflective
@:structAccess
@:native("IUnknown")
@:include("unknwn.h")
extern class NativeIUnknown
{
    @:native('Release')
    function release() : cpp.UInt64;

    @:native('AddRef')
    function addRef() : cpp.UInt64;

    @:native('QueryInterface')
    function queryInterface(_riid : GUID, _object : Star<Star<cpp.Void>>) : Int;
}
