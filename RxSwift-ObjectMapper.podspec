Pod::Spec.new do |s|
  s.name         = "RxSwift-ObjectMapper"
  s.version      = "1.1"
  s.summary      = "ObjectMapper bindings for RxSwift"
  s.description  = <<-EOS
  Easy to use ObjectMapper in RxSwift
  EOS
  s.homepage     = "https://github.com/psvmc/RxSwift-ObjectMapper"
  s.license      = { :type => "MIT", :file => "License" }
  s.author      = { "psvmc" => "183518918@qq.com" }
  s.requires_arc = 'true'
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
  }
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/psvmc/RxSwift-ObjectMapper.git", :tag => s.version }
  s.default_subspec = "Core"
  s.source_files = 'Source/RxSwift-ObjectMapper/*.swift'
  s.dependency "RxSwift", "~> 3.0"
  s.dependency "ObjectMapper", "~> 2.2"
  s.framework  = "Foundation"

end
