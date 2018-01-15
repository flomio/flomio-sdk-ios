Pod::Spec.new do |s|
  s.name             = 'FlomioSDK'
  s.version          = '2.3.0'
  s.summary          = "A turn-key middleware layer for Flomio's line of NFC, BLE, and UHF RFID readers."
  s.homepage         = 'https://github.com/flomio/flomio_mw_releases'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'scott@flomio.com' => 'condronscott@gmail.com' }
  s.source           = { :git => 'https://github.com/flomio/flomio_mw_releases.git', :tag => s.version.to_s }
  s.vendored_libraries = 'FlomioSDK/libSDKClasses.a'
  s.source_files = 'FlomioSDK/Classes/*'
  s.public_header_files = 'FlomioSDK/Classes/*.h'
  s.ios.deployment_target = '8.0'
  s.resource_bundles = {
    'FlomioSDK' => ['FlomioSDK/Assets/*']
  }
end
