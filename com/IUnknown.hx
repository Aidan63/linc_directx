package com;

import cpp.Star;

typedef IUnknown = Star<IUnknownRef>;

@:unreflective
@:structAccess
@:native("IUnknown")
@:include("unknwn.h")
extern class IUnknownRef
{
    @:native('Release')
    function release() : Void;
}
