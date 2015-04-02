Pod::Spec.new do |s|
	s.name		= 'RSTDataSourceKit'
	s.version	= '0.1'
	s.summary	= 'Data source objects that keep your view controllers light'
	s.homepage	= 'https://github.com/rosettastone/RSTDataSourceKit'
	s.license	= 'BSD 3.0'
	s.authors	= 'Rosetta Stone'
	s.source	= { :git => 'https://github.com/rosettastone/RSTDataSourceKit.git', :tag => s.version }
	s.platform  	= :ios, '8.0'
	s.source_files  = 'RSTDataSourceKit/RSTDataSourceKit/*.{h,m}'
	s.frameworks	= 'UIKit', 'Foundation', 'CoreData'
	s.requires_arc	= true
end
