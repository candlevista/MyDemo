platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

target "MyDemo" do

pod 'Masonry'
pod 'YYKit'
pod 'MBProgressHUD'
pod 'YBAttributeTextTapAction'
pod 'ReactiveCocoa', '~> 2.5'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
