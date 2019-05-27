package d3d11.enumerations;

/**
 * Comparison options.
 */
enum abstract D3d11ComparisonFunction(Int) to Int
{
    /**
     * Never pass the comparison.
     */
    var Never = 1;

    /**
     * If the source data is less than the destination data, the comparison passes.
     */
    var Less = 2;

    /**
     * If the source data is equal to the destination data, the comparison passes.
     */
    var Equal = 3;

    /**
     * If the source data is less than or equal to the destination data, the comparison passes.
     */
    var LessEqual = 4;

    /**
     * If the source data is greater than the destination data, the comparison passes.
     */
    var Greater = 5;

    /**
     * If the source data is not equal to the destination data, the comparison passes.
     */
    var NotEqual = 6;

    /**
     * If the source data is greater than or equal to the destination data, the comparison passes.
     */
    var GreaterEqual = 7;

    /**
     * Always pass the comparison.
     */
    var Always = 8;
}

@:keep
@:unreflective
@:structAccess
@:include('d3d11.h')
@:native('D3D11_COMPARISON_FUNC')
extern class NativeD3D11ComparisonFunction
{
    //
}
