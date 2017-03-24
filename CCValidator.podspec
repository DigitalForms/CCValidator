#
# Be sure to run `pod lib lint CCValidator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'CCValidator'
s.version          = '1.0.2'
s.summary          = 'CCValidator helps you validate credit card type and numbers correctness.'

s.description      = 'Check credit card type (full number not needed!)
                      and to check if the numbers are correct using Luhn algorithm.'

s.homepage         = 'https://github.com/DigitalForms/CCValidator'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Mariusz Wisniewski' => 'mariusz.wisniewski@digitalforms.pl' }
s.source           = { :git => 'https://github.com/DigitalForms/CCValidator.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.source_files = 'CCValidator/Classes/**/*'

# s.resource_bundles = {
#   'CCValidator' => ['CCValidator/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
end
