Pod::Spec.new do |s|
  s.name                      = "BIP39"
  s.version                   = "1.0.0"
  s.summary                   = "BIP39"
  s.homepage                  = "git@github.com:bitmark-inc/bip39-swift"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Anh Nguyen" => "support@bitmark.com" }
  s.source                    = { :git => "git@github.com:bitmark-inc/bip39-swift.git", :tag => s.version.to_s }
  s.swift_version             = "5.1"
  s.ios.deployment_target     = "8.0"
  s.tvos.deployment_target    = "9.0"
  s.watchos.deployment_target = "2.0"
  s.osx.deployment_target     = "10.10"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"
end
