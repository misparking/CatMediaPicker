Pod::Spec.new do |s|

  s.name         = "CatMediaPickerController"
  s.version      = "0.1.0"
  s.summary      = "The media picker controller that easy to use with my mind."
  s.homepage     = "https://github.com/K-cat/CatMediaPickerController"
  s.license      = "MIT"
  s.author             = { "K-cat" => "kcatismyname@icloud.com" }
  s.source       = { :git => "https://github.com/K-cat/CatMediaPickerController.git", :tag => "#{s.version}" }
  s.source_files  = "CatMediaPickerController/CatMediaPickerController/*.{h,m}", "CatMediaPickerController/CatMediaPickerController/*.{lproj}"
  s.resource  = "CatMediaPickerController/CatMediaPickerController/*.png"
  s.frameworks = "AssetsLibrary"
  s.requires_arc = true
end
