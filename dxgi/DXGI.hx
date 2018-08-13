package dxgi;

// DXGI_SWAP_EFFECT enum

@:unreflective
@:enum
extern abstract DXGI_SWAP_EFFECT(NATIVE_DXGI_SWAP_EFFECT)
{
    @:native('DXGI_SWAP_EFFECT_DISCARD')         var DISCARD;
    @:native('DXGI_SWAP_EFFECT_SEQUENTIAL')      var SEQUENTIAL;
    @:native('DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL') var FLIP_SEQUENTIAL;
    @:native('DXGI_SWAP_EFFECT_FLIP_DISCARD')    var FLIP_DISCARD;
}

@:unreflective
@:native('DXGI_SWAP_EFFECT')
private extern class NATIVE_DXGI_SWAP_EFFECT {}

// DXGI_FORMAT enum

@:unreflective
@:enum
extern abstract DXGI_FORMAT(NATIVE_DXGI_FORMAT)
{
    @:native('DXGI_FORMAT_UNKNOWN')                    var UNKNOWN;
    @:native('DXGI_FORMAT_R32G32B32A32_TYPELESS')      var R32G32B32A32_TYPELESS;
    @:native('DXGI_FORMAT_R32G32B32A32_FLOAT')         var R32G32B32A32_FLOAT;
    @:native('DXGI_FORMAT_R32G32B32A32_UINT')          var R32G32B32A32_UINT;
    @:native('DXGI_FORMAT_R32G32B32A32_SINT')          var R32G32B32A32_SINT;
    @:native('DXGI_FORMAT_R32G32B32_TYPELESS')         var R32G32B32_TYPELESS;
    @:native('DXGI_FORMAT_R32G32B32_FLOAT')            var R32G32B32_FLOAT;
    @:native('DXGI_FORMAT_R32G32B32_UINT')             var R32G32B32_UINT;
    @:native('DXGI_FORMAT_R32G32B32_SINT')             var R32G32B32_SINT;
    @:native('DXGI_FORMAT_R16G16B16A16_TYPELESS')      var R16G16B16A16_TYPELESS;
    @:native('DXGI_FORMAT_R16G16B16A16_FLOAT')         var R16G16B16A16_FLOAT;
    @:native('DXGI_FORMAT_R16G16B16A16_UNORM')         var R16G16B16A16_UNORM;
    @:native('DXGI_FORMAT_R16G16B16A16_UINT')          var R16G16B16A16_UINT;
    @:native('DXGI_FORMAT_R16G16B16A16_SNORM')         var R16G16B16A16_SNORM;
    @:native('DXGI_FORMAT_R16G16B16A16_SINT')          var R16G16B16A16_SINT;
    @:native('DXGI_FORMAT_R32G32_TYPELESS')            var R32G32_TYPELESS;
    @:native('DXGI_FORMAT_R32G32_FLOAT')               var R32G32_FLOAT;
    @:native('DXGI_FORMAT_R32G32_UINT')                var R32G32_UINT;
    @:native('DXGI_FORMAT_R32G32_SINT')                var R32G32_SINT;
    @:native('DXGI_FORMAT_R32G8X24_TYPELESS')          var R32G8X24_TYPELESS;
    @:native('DXGI_FORMAT_D32_FLOAT_S8X24_UINT')       var D32_FLOAT_S8X24_UINT;
    @:native('DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS')   var R32_FLOAT_X8X24_TYPELESS;
    @:native('DXGI_FORMAT_X32_TYPELESS_G8X24_UINT')    var X32_TYPELESS_G8X24_UINT;
    @:native('DXGI_FORMAT_R10G10B10A2_TYPELESS')       var R10G10B10A2_TYPELESS;
    @:native('DXGI_FORMAT_R10G10B10A2_UNORM')          var R10G10B10A2_UNORM;
    @:native('DXGI_FORMAT_R10G10B10A2_UINT')           var R10G10B10A2_UINT;
    @:native('DXGI_FORMAT_R11G11B10_FLOAT')            var R11G11B10_FLOAT;
    @:native('DXGI_FORMAT_R8G8B8A8_TYPELESS')          var R8G8B8A8_TYPELESS;
    @:native('DXGI_FORMAT_R8G8B8A8_UNORM')             var R8G8B8A8_UNORM;
    @:native('DXGI_FORMAT_R8G8B8A8_UNORM_SRGB')        var R8G8B8A8_UNORM_SRGB;
    @:native('DXGI_FORMAT_R8G8B8A8_UINT')              var R8G8B8A8_UINT;
    @:native('DXGI_FORMAT_R8G8B8A8_SNORM')             var R8G8B8A8_SNORM;
    @:native('DXGI_FORMAT_R8G8B8A8_SINT')              var R8G8B8A8_SINT;
    @:native('DXGI_FORMAT_R16G16_TYPELESS')            var R16G16_TYPELESS;
    @:native('DXGI_FORMAT_R16G16_FLOAT')               var R16G16_FLOAT;
    @:native('DXGI_FORMAT_R16G16_UNORM')               var R16G16_UNORM;
    @:native('DXGI_FORMAT_R16G16_UINT')                var R16G16_UINT;
    @:native('DXGI_FORMAT_R16G16_SNORM')               var R16G16_SNORM;
    @:native('DXGI_FORMAT_R16G16_SINT')                var R16G16_SINT;
    @:native('DXGI_FORMAT_R32_TYPELESS')               var R32_TYPELESS;
    @:native('DXGI_FORMAT_D32_FLOAT')                  var D32_FLOAT;
    @:native('DXGI_FORMAT_R32_FLOAT')                  var R32_FLOAT;
    @:native('DXGI_FORMAT_R32_UINT')                   var R32_UINT;
    @:native('DXGI_FORMAT_R32_SINT')                   var R32_SINT;
    @:native('DXGI_FORMAT_R24G8_TYPELESS')             var R24G8_TYPELESS;
    @:native('DXGI_FORMAT_D24_UNORM_S8_UINT')          var D24_UNORM_S8_UINT;
    @:native('DXGI_FORMAT_R24_UNORM_X8_TYPELESS')      var R24_UNORM_X8_TYPELESS;
    @:native('DXGI_FORMAT_X24_TYPELESS_G8_UINT')       var X24_TYPELESS_G8_UINT;
    @:native('DXGI_FORMAT_R8G8_TYPELESS')              var R8G8_TYPELESS;
    @:native('DXGI_FORMAT_R8G8_UNORM')                 var R8G8_UNORM;
    @:native('DXGI_FORMAT_R8G8_UINT')                  var R8G8_UINT;
    @:native('DXGI_FORMAT_R8G8_SNORM')                 var R8G8_SNORM;
    @:native('DXGI_FORMAT_R8G8_SINT')                  var R8G8_SINT;
    @:native('DXGI_FORMAT_R16_TYPELESS')               var R16_TYPELESS;
    @:native('DXGI_FORMAT_R16_FLOAT')                  var R16_FLOAT;
    @:native('DXGI_FORMAT_D16_UNORM')                  var D16_UNORM;
    @:native('DXGI_FORMAT_R16_UNORM')                  var R16_UNORM;
    @:native('DXGI_FORMAT_R16_UINT')                   var R16_UINT;
    @:native('DXGI_FORMAT_R16_SNORM')                  var R16_SNORM;
    @:native('DXGI_FORMAT_R16_SINT')                   var R16_SINT;
    @:native('DXGI_FORMAT_R8_TYPELESS')                var R8_TYPELESS;
    @:native('DXGI_FORMAT_R8_UNORM')                   var R8_UNORM;
    @:native('DXGI_FORMAT_R8_UINT')                    var R8_UINT;
    @:native('DXGI_FORMAT_R8_SNORM')                   var R8_SNORM;
    @:native('DXGI_FORMAT_R8_SINT')                    var R8_SINT;
    @:native('DXGI_FORMAT_A8_UNORM')                   var A8_UNORM;
    @:native('DXGI_FORMAT_R1_UNORM')                   var R1_UNORM;
    @:native('DXGI_FORMAT_R9G9B9E5_SHAREDEXP')         var R9G9B9E5_SHAREDEXP;
    @:native('DXGI_FORMAT_R8G8_B8G8_UNORM')            var R8G8_B8G8_UNORM;
    @:native('DXGI_FORMAT_G8R8_G8B8_UNORM')            var G8R8_G8B8_UNORM;
    @:native('DXGI_FORMAT_BC1_TYPELESS')               var BC1_TYPELESS;
    @:native('DXGI_FORMAT_BC1_UNORM')                  var BC1_UNORM;
    @:native('DXGI_FORMAT_BC1_UNORM_SRGB')             var BC1_UNORM_SRGB;
    @:native('DXGI_FORMAT_BC2_TYPELESS')               var BC2_TYPELESS;
    @:native('DXGI_FORMAT_BC2_UNORM')                  var BC2_UNORM;
    @:native('DXGI_FORMAT_BC2_UNORM_SRGB')             var BC2_UNORM_SRGB;
    @:native('DXGI_FORMAT_BC3_TYPELESS')               var BC3_TYPELESS;
    @:native('DXGI_FORMAT_BC3_UNORM')                  var BC3_UNORM;
    @:native('DXGI_FORMAT_BC3_UNORM_SRGB')             var BC3_UNORM_SRGB;
    @:native('DXGI_FORMAT_BC4_TYPELESS')               var BC4_TYPELESS;
    @:native('DXGI_FORMAT_BC4_UNORM')                  var BC4_UNORM;
    @:native('DXGI_FORMAT_BC4_SNORM')                  var BC4_SNORM;
    @:native('DXGI_FORMAT_BC5_TYPELESS')               var BC5_TYPELESS;
    @:native('DXGI_FORMAT_BC5_UNORM')                  var BC5_UNORM;
    @:native('DXGI_FORMAT_BC5_SNORM')                  var BC5_SNORM;
    @:native('DXGI_FORMAT_B5G6R5_UNORM')               var B5G6R5_UNORM;
    @:native('DXGI_FORMAT_B5G5R5A1_UNORM')             var B5G5R5A1_UNORM;
    @:native('DXGI_FORMAT_B8G8R8A8_UNORM')             var B8G8R8A8_UNORM;
    @:native('DXGI_FORMAT_B8G8R8X8_UNORM')             var B8G8R8X8_UNORM;
    @:native('DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM') var R10G10B10_XR_BIAS_A2_UNORM;
    @:native('DXGI_FORMAT_B8G8R8A8_TYPELESS')          var B8G8R8A8_TYPELESS;
    @:native('DXGI_FORMAT_B8G8R8A8_UNORM_SRGB')        var B8G8R8A8_UNORM_SRGB;
    @:native('DXGI_FORMAT_B8G8R8X8_TYPELESS')          var B8G8R8X8_TYPELESS;
    @:native('DXGI_FORMAT_B8G8R8X8_UNORM_SRGB')        var B8G8R8X8_UNORM_SRGB;
    @:native('DXGI_FORMAT_BC6H_TYPELESS')              var BC6H_TYPELESS;
    @:native('DXGI_FORMAT_BC6H_UF16')                  var BC6H_UF16;
    @:native('DXGI_FORMAT_BC6H_SF16')                  var BC6H_SF16;
    @:native('DXGI_FORMAT_BC7_TYPELESS')               var BC7_TYPELESS;
    @:native('DXGI_FORMAT_BC7_UNORM')                  var BC7_UNORM;
    @:native('DXGI_FORMAT_BC7_UNORM_SRGB')             var BC7_UNORM_SRGB;
    @:native('DXGI_FORMAT_AYUV')                       var AYUV;
    @:native('DXGI_FORMAT_Y410')                       var Y410;
    @:native('DXGI_FORMAT_Y416')                       var Y416;
    @:native('DXGI_FORMAT_NV12')                       var NV12;
    @:native('DXGI_FORMAT_P010')                       var P010;
    @:native('DXGI_FORMAT_P016')                       var P016;
    @:native('DXGI_FORMAT_420_OPAQUE')                 var OPAQUE_420;
    @:native('DXGI_FORMAT_YUY2')                       var YUY2;
    @:native('DXGI_FORMAT_Y210')                       var Y210;
    @:native('DXGI_FORMAT_Y216')                       var Y216;
    @:native('DXGI_FORMAT_NV11')                       var NV11;
    @:native('DXGI_FORMAT_AI44')                       var AI44;
    @:native('DXGI_FORMAT_IA44')                       var IA44;
    @:native('DXGI_FORMAT_P8')                         var P8;
    @:native('DXGI_FORMAT_A8P8')                       var A8P8;
    @:native('DXGI_FORMAT_B4G4R4A4_UNORM')             var B4G4R4A4_UNORM;
    @:native('DXGI_FORMAT_P208')                       var P208;
    @:native('DXGI_FORMAT_V208')                       var V208;
    @:native('DXGI_FORMAT_V408')                       var V408;
    @:native('DXGI_FORMAT_FORCE_UINT')                 var FORCE_UINT;
}

@:unreflective
@:native('DXGI_FORMAT')
private extern class NATIVE_DXGI_FORMAT {}

// DXGI class with constants and static functions

@:unreflective
@:include("dxgi.h")
extern class DXGI
{
    inline static var USAGE_SHADER_INPUT         = 0x00000010;
    inline static var USAGE_RENDER_TARGET_OUTPUT = 0x00000020;
    inline static var USAGE_BACK_BUFFER          = 0x00000040;
    inline static var USAGE_SHARED               = 0x00000080;
    inline static var USAGE_READ_ONLY            = 0x00000100;
    inline static var USAGE_DISCARD_ON_PRESENT   = 0x00000200;
    inline static var USAGE_UNORDERED_ACCESS     = 0x00000400;

    inline static function createFactory(_factory : Factory) : Int
    {
        return untyped __cpp__('CreateDXGIFactory(__uuidof(IDXGIFactory), (void**)&{0})', _factory);
    }
}
