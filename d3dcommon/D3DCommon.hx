package d3dcommon;

// D3D_FEATURE_LEVEL enum

@:enum extern abstract D3D_FEATURE_LEVEL(NATIVE_D3D_FEATURE_LEVEL)
{
    @:native('D3D_FEATURE_LEVEL_9_1')  var LEVEL_9_1;
    @:native('D3D_FEATURE_LEVEL_9_2')  var LEVEL_9_2;
    @:native('D3D_FEATURE_LEVEL_9_3')  var LEVEL_9_3;
    @:native('D3D_FEATURE_LEVEL_10_0') var LEVEL_10_0;
    @:native('D3D_FEATURE_LEVEL_10_1') var LEVEL_10_1;
    @:native('D3D_FEATURE_LEVEL_11_0') var LEVEL_11_0;
}

@:native('::cpp::Struct<D3D_FEATURE_LEVEL, ::cpp::EnumHandler>')
private extern class NATIVE_D3D_FEATURE_LEVEL {}

// D3D_PRIMITIVE_TOPOLOGY enum

@:enum extern abstract D3D_PRIMITIVE_TOPOLOGY(NATIVE_D3D_PRIMITIVE_TOPOLOGY)
{
    @:native('D3D_PRIMITIVE_TOPOLOGY_UNDEFINED')     var UNDEFINED;
    @:native('D3D_PRIMITIVE_TOPOLOGY_POINTLIST')     var POINTLIST;
    @:native('D3D_PRIMITIVE_TOPOLOGY_LINELIST')      var LINELIST;
    @:native('D3D_PRIMITIVE_TOPOLOGY_LINESTRIP')     var LINESTRIP;
    @:native('D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST')  var TRIANGLELIST;
    @:native('D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP') var TRIANGLESTRIP;
}

@:native('::cpp::Struct<D3D_PRIMITIVE_TOPOLOGY, ::cpp::EnumHandler>')
private extern class NATIVE_D3D_PRIMITIVE_TOPOLOGY {}
