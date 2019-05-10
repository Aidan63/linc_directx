package directx;

@:keep
@:include('linc_directx.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('directx'))
#end
extern class DirectX
{
    inline static function include() : Void
    {
        //
    }
}
