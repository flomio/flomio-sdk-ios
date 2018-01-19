Pod::Spec.new do |s|
  s.name             = 'FlomioSDK'
  s.version          = '2.3.0'
  s.summary          = "A turn-key middleware layer for Flomio's line of NFC, BLE, and UHF RFID readers."
  s.homepage         = "http://www.flomio.com"
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2017 Estimote, Inc. All rights reserved.
      LICENSE
  }
  s.requires_arc = true
  s.author           = { 'scott@flomio.com' => 'condronscott@gmail.com' }
  s.source           = { :git => 'https://github.com/flomio/flomio_mw_releases.git', :tag => s.version.to_s }
  s.vendored_frameworks = 'FlomioSDK/FlomioSDK.framework'
  s.source_files = ['FlomioSDK/FlomioSDK.framework/Headers/*.h', 'FlomioSDK/Classes/*']
  s.ios.deployment_target = '8.0'
  s.resource_bundles = {
    'FlomioSDK' => ['FlomioSDK/Assets/*']
  }
end
