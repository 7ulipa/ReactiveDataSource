Pod::Spec.new do |s|
  s.name             = 'ReactiveDataSource'
  s.version          = '0.2.3'
  s.summary          = 'Make data source change easy'

  s.description      = <<-DESC
    Make data source change more easy
                       DESC

  s.homepage         = 'https://github.com/7ulipa/ReactiveDataSource'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tulipa' => 'darwin.jxzang@gmail.com' }
  s.source           = { :git => 'https://github.com/7ulipa/ReactiveDataSource.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ReactiveDataSource/Classes/**/*'

end
