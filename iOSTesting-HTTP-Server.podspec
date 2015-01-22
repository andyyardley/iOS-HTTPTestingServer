Pod::Spec.new do |s|
s.name = 'iOSTesting-HTTP-Server'
s.version = '1.0.0'
s.platform = :ios
s.ios.deployment_target = '7.0'
s.source_files = 'iOSTesting-HTTP-Server/*.{h,m}'
s.requires_arc = true
end