FACEBOOK_APP_ID = ENV['FACEBOOK_APP_ID'] || '346465555368385'
FACEBOOK_APP_SECRET = ENV['FACEBOOK_APP_SECRET'] || 'b77892635badd141dd14d625d9938adc'

if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider : twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :twitter, 'TPvS53Dgr266nK3EWSxA', 'OfiScfmbbGt9DBDTfNWoPtpQDIlAFPhQOTlsiIo2k'

  case Rails.env
  when "production"
    provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, {:scope => 'publish_stream,offline_access,email', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
  else
    provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET,{ :scope => 'publish_stream,offline_access,email' }
  end
end
