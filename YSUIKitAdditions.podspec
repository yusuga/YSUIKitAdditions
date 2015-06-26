Pod::Spec.new do |s|
  s.name = 'YSUIKitAdditions'
  s.version = '0.0.24'
  s.summary = 'UIKit categories.'
  s.homepage = 'https://github.com/yusuga/YSUIKitAdditions'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/YSUIKitAdditions.git', :tag => s.version.to_s }
    s.platform = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.source_files = 'Classes/YSUIKitAdditions/*.{h,m}'
end