package dxgi.structures;

import cpp.Function;
import cpp.vm.Gc;
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

            Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
        }
        else
        {
            backing = _existing.ptr;
        }
    }

    @:void
    static function finalize(_obj : DxgiFrameStatistics)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
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

    @:native('PresentCount')
    var presentCount : cpp.UInt32;

    @:native('PresentRefreshCount')
    var presentRefreshCount : cpp.UInt32;

    @:native('SyncRefreshCount')
    var syncRefreshCount : cpp.UInt32;

    @:native('SyncQPCTime')
    var syncQpcTime : LargeInteger;

    @:native('SyncGPUTime')
    var syncGpuTime : LargeInteger;
}
