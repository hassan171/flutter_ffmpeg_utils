#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ffmpeg_utils.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_ffmpeg_utils'
  s.version          = '1.0.1'
  s.summary          = 'Flutter plugin to execute FFmpeg commands.'
  s.description      = <<-DESC
A plugin that allows you to execute FFmpeg commands in your Flutter app on Android and iOS.
                       DESC
  s.homepage         = 'https://github.com/Raghav117/flutter_ffmpeg_utils'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Raghav Garg' => 'raghavgarg.81.rg@gmail.com' }
  s.ios.deployment_target = '13.0'
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ffmpeg-kit-ios-full', '6.0'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'ffmpeg_utils_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
