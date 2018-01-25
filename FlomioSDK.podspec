Pod::Spec.new do |s|
    s.name             = 'FlomioSDK'
    s.version          = '2.3.1'
    s.summary          = "An iOS library for FLomio's line of NFC, BLE, and UHF RFID readers."
    s.homepage         = "http://www.flomio.com"
    s.license      = {
        :type => 'Copyright',
        :text => <<-LICENSE
        Copyright 2018 Flomio, Inc. All rights reserved.
        LICENSE
    }
    s.requires_arc = true
    s.author           = { 'scott@flomio.com' => 'condronscott@gmail.com' }
    s.source           = { :git => 'https://github.com/flomio/flomio_mw_releases.git', :tag => s.version.to_s }
    s.vendored_frameworks = 'FlomioSDK/FlomioSDK.framework'
    s.source_files = ['FlomioSDK/FlomioSDK.framework/Headers/*']
    s.platform    = :ios
    s.library = 'z'
    s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/FlomioSDK"',
        'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Headers/FlomioSDK"',
        'OTHER_LDFLAGS' => '"-lc++"
        "-ObjC"',
        'ENABLE_BITCODE' => 'NO',
    }
    s.resource_bundles = {
        'FlomioSDK' => ['FlomioSDK/Assets/*']
    }
    s.ios.deployment_target = '8.0'
end



