Pod::Spec.new do |s|

  s.name         = "APLTableViewModel"
  s.version      = "0.0.1"
  s.summary      = "A table view model which can inform a delegate about changes."

  s.description  = <<-DESC
                   A table view model which can inform a delegate about changes.
                   DESC

  s.homepage     = "https://github.com/apploft/APLTableViewModel"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Tino Rachui" => "tino.rachui@apploft.de" }
  
  s.platform     = :ios, "7.0"
  
  s.source       = { :git => "https://github.com/apploft/APLTableViewModel.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true

end
