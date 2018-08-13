package com;

@:unreflective
@:native("::cpp::Pointer<IUnknown>")
@:include("unknwn.h")
extern class IUnknown
{
    inline function release() : Void
    {
        untyped __cpp__('{0}->ptr->Release()', this);
    }
}
