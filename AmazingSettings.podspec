Pod::Spec.new do |s|
  s.name         = 'AmazingSettings'
  s.version      = '0.0.1'
  s.license      = 'License'
  s.homepage     = 'http://www.futuredial.com'
  s.authors      = 'sujian': 'su.jian@me.com'
  s.summary      = '基于ReactiveCocoa的设置'

  s.platform     =  :ios, 'iOS7'
  s.source       =  git: 'Github Repo URL', :tag => s.version
  s.source_files = 'Resources'
  s.frameworks   =  'Required Frameworks'
  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod 'ReactiveCocoa','~> 2.5'
  s.dependencies =	pod 'Masonry', '~> 1.0.1'
  s.dependencies =	pod 'MBProgressHUD', '~> 0.9.2'

end