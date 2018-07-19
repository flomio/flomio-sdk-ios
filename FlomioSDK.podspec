Pod::Spec.new do |s|
    s.name             = 'FlomioSDK'
    s.version          = '3.0.3-beta3'
    s.summary          = "An iOS library for Flomio's line of NFC, BLE, and UHF RFID readers."
    s.homepage         = 'https://github.com/flomio/flomio-sdk-ios'
    s.license          = {
        :type => 'Copyright',
        :text => <<-LICENSE
        Copyright 2018 Flomio, Inc. All rights reserved.
        LICENSE
    }
    s.requires_arc = true
    s.author           = { 'scott@flomio.com' => 'condronscott@gmail.com' }
    s.source           = { :git => 'https://github.com/flomio/flomio-sdk-ios.git', :tag => s.version.to_s }
    s.vendored_frameworks = 'FlomioSDK/FlomioSDK.framework'
    s.platform         = :ios
    s.library          = 'z'
    s.xcconfig         =  { 
        'OTHER_LDFLAGS' => '"-lc++"
        "-ObjC"',
        'ENABLE_BITCODE' => 'NO',
    }
    s.resource_bundles = {
        'FlomioSDK' => ['FlomioSDK/Assets/*']
    }
    s.ios.deployment_target = '8.0'
end



