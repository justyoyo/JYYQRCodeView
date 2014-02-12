Pod::Spec.new do |s|
  s.name                = "JYYQRCodeImageView"
  s.version             = "1.0.0"
  s.summary             = "UIImageView Subclass for displaying a QR Code"
  s.license             = :type => 'BSD' 
  s.homepage            = "https://stripe.com"
  s.author              = { "Alex MacCaw" => "alex@stripe.com" }
  s.source              = { :git => "https://github.com/justyoyo/JYYQRCodeImageView.git", :tag => "1.01"}
  s.source_files        = 'JYYQRCodeImageView/*.{h,m}'
  s.public_header_files = 'JYYQRCodeImageView/*.h'
  s.platform            = :ios
  s.requires_arc        = true
end