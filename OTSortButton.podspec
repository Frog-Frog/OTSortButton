#
#  Be sure to run `pod spec lint OTSortButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "OTSortButton"
  s.version      = "1.0"
  s.summary      = "OTSortButton is a UIButton library useful for sorting."
  s.homepage     = "https://github.com/PKPK-Carnage"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Tomosuke Okada" => "pkpkcarnage@gmail.com" }
  s.social_media_url   = "https://github.com/PKPK-Carnage"
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/PKPK-Carnage/OTSortButton.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "Classes/**/*.{swift}"
  s.resource_bundles = {
    'OTSortButton' => ['Classes/*.xcassets']
  }

  s.requires_arc = true


end
