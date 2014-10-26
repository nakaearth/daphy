Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_SECRET_KEY"]
end
OmniAuth.config.on_failure = SessionsController.action(:oauth_failure)
