#
# Be sure to run `pod lib lint GoKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GoKit'
  s.version          = '0.1.0'
  s.summary          = 'A tool kit used in Zego Go-series apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zegoim/ZegoGoKit-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vic' => 'vicwan@zego.im' }
  s.source           = { :git => 'git@github.com:zegoim/ZegoGoKit-iOS.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  s.resource_bundles = {
    'GoKit' => ['GoKit/Assets/Resources/*']
  }
  
  s.subspec 'GoUIKit' do |ss|
    ss.source_files = 'GoKit/Classes/GoUIKit/*'
    ss.dependency 'MBProgressHUD'
    ss.dependency 'Toast'
    
    ss.subspec 'GoHalfModalPresentation' do |sss|
      sss.source_files = 'GoKit/Classes/GoUIKit/GoHalfModal/*'
      sss.dependency 'GoKit/GoUtils'
    end
  end
  
  s.subspec 'GoUtils' do |ss|
    ss.source_files = 'GoKit/Classes/GoUtils/**/*.{h,m}'
    ss.frameworks = 'AVFoundation', 'Photos'
  end
  
end
