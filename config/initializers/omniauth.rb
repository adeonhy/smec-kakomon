require 'omniauth-openid'
require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'OI6tgNdXyC8Zm1XhXlkZPA', 'BEcgdP5f6JRNA9wiTSasQnwW848X3YaiqB2YHVug'
  provider :facebook, '231231420346564', 'd0abf727320a4b175f5de708ccc0c2ca'
  provider :open_id, :store => OpenID::Store::Filesystem.new(Rails.root.join('tmp','openid'))
  provider :open_id, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end
