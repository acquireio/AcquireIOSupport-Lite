Pod::Spec.new do |s|
  s.name             = 'AcquireIOSupport-Lite'
  s.version          = '1.1.7'
  s.summary          = 'Unified platform for customer communication'
  s.homepage         = 'https://developer.acquire.io/v/2.0.0/sdk/ios/sdk-setup-guide/integration-guide-lite'
  s.license          = { :type => 'Commercial', :text => 'Copyright (C) 2021 by Acquire' }
  s.author           = { 'Acquire' => 'chirag.savaliya@acquire.io' }
  s.source           = { :git => 'https://github.com/acquireio/AcquireIOSupport-Lite.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/acquire_io'
  
  s.ios.deployment_target = '11.0'
  
  s.swift_version = '5.3'
  
  s.ios.vendored_frameworks = 'AcquireIOSupport.xcframework'
 
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.dependency 'Socket.IO-Client-Swift', '~> 16.0.0'
  
end
