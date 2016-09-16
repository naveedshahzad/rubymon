OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1101833879904683', '716d6aabd8db2c4c181390eb69998569'
end

OmniAuth.config do |config|
    config.on_failure do
      #binding.pry
    end
end
