#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_tts_improved'
  s.version          = '0.0.1'
  s.summary          = 'A fork of the Flutter_TTS plugin, that uses the progress reporters of the Utterance APIs, on both Android and iOS.'
  s.description      = <<-DESC
A fork of the Flutter_TTS plugin, that uses the progress reporters of the Utterance APIs, on both Android and iOS.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Loushou' => 'life.42@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end

