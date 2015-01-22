
Pod::Spec.new do |s|

  s.name         = "iOSTesting-HTTP-Server"
  s.version      = "1.0.0"
  s.summary      = ""

  s.description  = <<-DESC
                   A longer description of ZappMerchantLib in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  # s.homepage     = "http://www.zapp.co.uk"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "Apache 2.0"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.authors            = { "Benjamin Whiting" => "ben.whiting@vocalink.com" }

  s.prefix_header_contents = '#import "ZappMerchantLib.h"'

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"

  #s.source       = { :git => "", :commit => "" }

  s.source_files  = "ZappMerchantLib/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  s.resources = "ZappMerchantLibResources/**/*.png", "ZappMerchantLibResources/**/*.otf", "ZappMerchantLib/**/*.xib"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency ""

end
