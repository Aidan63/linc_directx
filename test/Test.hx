import dxgi.Adapter;
import directx.DirectX;

class Test
{    
    static function main()
    {
        DirectX.include();

        var adapter : Adapter = null;

        trace(adapter);
    }
}