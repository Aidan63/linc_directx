package dxgi.enumerations;

/**
 * Flags indicating how an image is stretched to fit a given monitor's resolution.
 */
enum abstract DxgiModeScaling(Int) to Int
{
    /**
     * Unspecified scaling.
     */
    var Unspecified = 0;

    /**
     * Specifies no scaling. The image is centered on the display.
     * This flag is typically used for a fixed-dot-pitch display (such as an LED display).
     */
    var Centered  = 1;

    /**
     * Specifies stretched scaling.
     */
    var Stretched = 2;
}

@:keep
@:unreflective
@:include('dxgi.h')
@:native('DXGI_MODE_SCALING')
extern class NativeDXGIModeScaling
{
    //
}
