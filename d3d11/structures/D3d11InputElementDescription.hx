package d3d11.structures;

import cpp.Function;
import cpp.vm.Gc;
import cpp.Star;
import cpp.Pointer;
import cpp.ConstCharStar;
import dxgi.enumerations.DxgiFormat;
import d3d11.enumerations.D3d11InputClassification;

/**
 * A description of a single element for the input-assembler stage.
 */
class D3d11InputElementDescription
{
    public final backing : Star<NativeD3D11InputElementDescription>;

    /**
     * The HLSL semantic associated with this element in a shader input-signature.
     */
    public var semanticName (get, set) : String;

    inline function get_semanticName() : String return backing.semanticName;

    inline function set_semanticName(_v : String) : String return backing.semanticName = _v;

    /**
     * The semantic index for the element.
     * A semantic index modifies a semantic, with an integer index number.
     * A semantic index is only needed in a case where there is more than one element with the same semantic.
     * For example, a 4x4 matrix would have four components each with the semantic name `matrix`, however each of the four component would have different semantic indices (0, 1, 2, and 3).
     */
    public var semanticIndex (get, set) : Int;

    inline function get_semanticIndex() : Int return backing.semanticIndex;

    inline function set_semanticIndex(_v : Int) : Int return backing.semanticIndex = _v;

    /**
     * The data type of the element data. See `DXGI_FORMAT`.
     */
    public var format (get, set) : DxgiFormat;

    inline function get_format() : DxgiFormat return cast backing.format;

    inline function set_format(_v : DxgiFormat) : DxgiFormat
    {
        backing.format = cast _v;

        return _v;
    }

    /**
     * An integer value that identifies the input-assembler (see input slot). Valid values are between 0 and 15, defined in D3D11.h.
     */
    public var inputSlot (get, set) : Int;

    inline function get_inputSlot() : Int return backing.inputSlot;

    inline function set_inputSlot(_v : Int) : Int return backing.inputSlot = _v;

    /**
     * Optional. Offset (in bytes) between each element.
     * Use `D3D11_APPEND_ALIGNED_ELEMENT` for convenience to define the current element directly after the previous one, including any packing if necessary.
     */
    public var alignedByteOffset (get, set) : Int;

    inline function get_alignedByteOffset() : Int return backing.alignedByteOffset;

    inline function set_alignedByteOffset(_v : Int) : Int return backing.alignedByteOffset = _v;

    /**
     * Identifies the input data class for a single input slot (see `D3D11_INPUT_CLASSIFICATION`).
     */
    public var inputSlotClass (get, set) : D3d11InputClassification;

    inline function get_inputSlotClass() : D3d11InputClassification return cast backing.inputSlotClass;

    inline function set_inputSlotClass(_v : D3d11InputClassification) : D3d11InputClassification
    {
        backing.inputSlotClass = cast _v;

        return _v;
    }

    /**
     * The number of instances to draw using the same per-instance data before advancing in the buffer by one element.
     * This value must be 0 for an element that contains per-vertex data (the slot class is set to `D3D11_INPUT_PER_VERTEX_DATA`).
     */
    public var instanceDataStepRate : Int;

    inline function get_instanceDataStepRate() : Int return backing.instanceDataStepRate;

    inline function set_instanceDataStepRate(_v : Int) : Int return backing.instanceDataStepRate = _v;

    public function new(_existing : Pointer<NativeD3D11InputElementDescription> = null)
    {
        if (_existing == null)
        {
            backing = NativeD3D11InputElementDescription.createPtr();
        }
        else
        {
            backing = _existing.ptr;
        }

        Gc.setFinalizer(this, Function.fromStaticFunction(finalize));
    }

    @:void
    static function finalize(_obj : D3d11InputElementDescription)
    {
        Pointer.fromRaw(cast _obj.backing).destroy();
    }
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_INPUT_ELEMENT_DESC')
extern class NativeD3D11InputElementDescription
{
    @:native('new D3D11_INPUT_ELEMENT_DESC')
    static function createPtr() : Star<NativeD3D11InputElementDescription>;

    @:native('D3D11_INPUT_ELEMENT_DESC')
    static function createRef() : NativeD3D11InputElementDescription;

    @:native('SemanticName')
    var semanticName : ConstCharStar;

    @:native('SemanticIndex')
    var semanticIndex : cpp.UInt32;

    @:native('Format')
    var format : NativeDXGIFormat;

    @:native('InputSlot')
    var inputSlot : cpp.UInt32;

    @:native('AlignedByteOffset')
    var alignedByteOffset : cpp.UInt32;

    @:native('InputSlotClass')
    var inputSlotClass : NativeD3D11InputClassification;

    @:native('InstanceDataStepRate')
    var instanceDataStepRate : cpp.UInt32;
}
