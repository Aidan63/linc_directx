package d3dcompiler.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Pointer;
import cpp.Star;
import cpp.ConstCharStar;

/**
 * Defines a shader macro.
 */
class D3dShaderMacro
{
    public final backing : Star<NativeD3DShaderMacro>;

    /**
     * The macro name.
     */
    public var name (get, set) : String;

    inline function get_name() : String return backing.name;

    inline function set_name(_v : String) : String return backing.name = _v;

    /**
     * The macro definition.
     */
    public var definition (get, set) : String;

    inline function get_definition() : String return backing.definition;

    inline function set_definition(_v : String) : String return backing.definition = _v;

    public function new(_existing : Pointer<NativeD3DShaderMacro> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3DShaderMacro.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    @:void
    static function finalize(_obj : D3dShaderMacro)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3dcommon.h')
@:native('D3D_SHADER_MACRO')
extern class NativeD3DShaderMacro
{
    @:native('new D3D_SHADER_MACRO')
    static function createPtr() : Star<NativeD3DShaderMacro>;

    @:native('D3D_SHADER_MACRO')
    static function createRef() : NativeD3DShaderMacro;

    @:native('Name')
    var name : ConstCharStar;

    @:native('Definition')
    var definition : ConstCharStar;
}
