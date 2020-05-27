Pod::Spec.new do |s|
  s.name                      = "BIP39"
  s.version                   = "1.0.0"
  s.summary                   = "BIP39"
  s.homepage                  = "https://github.com/bitmark-inc/bip39-swift"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Bitmark Inc." => "support@bitmark.com" }
  s.social_media_url = "https://twitter.com/bitmarkinc"
  s.source                    = { :git => "https://github.com/bitmark-inc/bip39-swift", :tag => s.version.to_s }
  s.swift_version             = "5.1"
  s.ios.deployment_target     = "8.0"
  s.tvos.deployment_target    = "9.0"
  s.watchos.deployment_target = "2.0"
  s.osx.deployment_target     = "10.10"
  s.source_files              = "Sources/**/*"
  s.preserve_paths            = "Sources/module.map"
  s.xcconfig                  = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/BIP39/Sources' }
  s.frameworks                = "Foundation"
end
