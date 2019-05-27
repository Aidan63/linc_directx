package com;

import cpp.Star;

@:keep
@:unreflective
@:structAccess
@:include('winnt.h')
@:native('LARGE_INTEGER')
extern class LargeInteger
{
    @:native('new LARGE_INTEGER')
    static function createPtr() : Star<LargeInteger>;

    @:native('LARGE_INTEGER')
    static function createRef() : LargeInteger;

    @:native('QuadPart')
    var quadPart : cpp.Int64;
}
