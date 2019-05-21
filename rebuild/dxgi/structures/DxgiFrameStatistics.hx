package dxgi.structures;

import haxe.Int64;
import cpp.Pointer;
import cpp.Star;
import com.LargeInteger;

class DxgiFrameStatistics
{
    public final backing : Star<NativeDXGIFrameStatistics>;

    public var syncQpcTime (get, set) : Int64;

    inline function get_syncQpcTime() : Int64 return backing.syncQpcTime.quadPart;

    inline function set_syncQpcTime(_v : Int64) : Int64 return backing.syncQpcTime.quadPart = cast _v;

    public var syncGpuTime : Int64;

    inline function get_syncGpuTime() : Int64 return backing.syncGpuTime.quadPart;

    inline function set_syncGpuTime(_v : Int64) : Int64 return backing.syncGpuTime.quadPart = cast _v;

    public function new(_existing : Pointer<NativeDXGIFrameStatistics> = null)
    {
        if (_existing == null)
        {
            backing = NativeDXGIFrameStatistics.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }
    }
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
@:native('DXGI_FRAME_STATISTICS')
extern class NativeDXGIFrameStatistics
{
    @:native('new DXGI_FRAME_STATISTICS')
    static function createPtr() : Star<NativeDXGIFrameStatistics>;

    @:native('DXGI_FRAME_STATISTICS')
    static function createRef() : NativeDXGIFrameStatistics;

    var presentCount : cpp.UInt32;

    var presentRefreshCount : cpp.UInt32;

    var syncRefreshCount : cpp.UInt32;

    var syncQpcTime : LargeInteger;

    var syncGpuTime : LargeInteger;
}
