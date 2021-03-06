require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Daphy
  class Application < Rails::Application

   config.generators do |g|
      g.orm :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.view_specs true
      g.controller_specs true
      g.routing_specs true
      g.helper_specs false
      g.request_specs true
      g.assets true
      g.helper false
    end
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Tokyo'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    ## fluentd
    # config.log_level = :info
    # config.logger = ActFluentLoggerRails::Logger.new
    # config.lograge.enabled = true
    # config.lograge.formatter = Lograge::Formatters::Json.new
  end
end
