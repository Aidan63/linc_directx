package utils;

import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;

@:keep
@:unreflective
@:structAccess
@:include('vector')
@:native('std::vector')
extern class StdVector<T>
{
    function data() : Star<T>;

    @:native('data')
    function raw() : RawPointer<T>;

    function at(_index : Int) : Reference<T>;

    inline function set(_key : Int, _value : T) : T
    {
        return untyped __cpp__('{0}[{1}] = {2}', this, _key, _value);
    }

    inline function get(_key : Int) : T
    {
        return untyped __cpp__('{0}[{1}]', this, _key);
    }
}