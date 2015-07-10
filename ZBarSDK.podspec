#
# Be sure to run `pod lib lint ZBarSDK.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZBarSDK"
  s.version          = "1.3.2"
  s.summary          = "A short description of ZBarSDK."
  s.description      = <<-DESC
                       ZBar is an open source software suite for reading bar codes from various sources, such as video streams, image files and raw intensity sensors. It supports many popular symbologies (types of bar codes) including EAN-13/UPC-A, UPC-E, EAN-8, Code 128, Code 39, Interleaved 2 of 5 and QR Code.
                       DESC

  s.homepage = "https://github.com/mdewolfe"
  s.license          = 'MIT'
  s.author           = { "Mike De Wolfe" => "mdewolfe@innobec.com" }
  s.source           = { :git => "https://github.com/mdewolfe/ZBarSDK.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = false

  s.public_header_files = [ 'iphone/**/**/*.h', 'include/*.h' ]

  s.source_files = [
      "include/zbar.h",
      "zbar/**/*.h",
      "iphone/*.h",
      "iphone/include/**/*.h",
      "zbar/{config,decoder,error,image,img_scanner,refcnt,scanner,symbol}.c",
      "zbar/decoder/{codabar,code39,code93,code128,databar,ean,i25,qr_finder}.c",
      "zbar/qrcode/*.c",
      "iphone/*.m" ]

  s.resources = "iphone/res/{zbar-*.png,zbar-help.html}"

  s.frameworks = [ 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'QuartzCore' ]

  s.libraries = 'iconv'
  s.xcconfig = {
      "EXCLUDED_SOURCE_FILE_NAMES[sdk=iphoneos*][arch=*]" => "ZBarReaderViewImpl_Simulator.m",
      "EXCLUDED_SOURCE_FILE_NAMES[sdk=iphonesimulator*][arch=*]" => "ZBarReaderViewImpl_Capture.m ZBarCaptureReader.m",
      "GCC_PREPROCESSOR_DEFINITIONS" => "NDEBUG=1"
  }

  s.prefix_header_file = "iphone/include/prefix.pch"
  s.compiler_flags = '-w'

end
