require File.expand_path('../boot', __FILE__)
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
Bundler.require(*Rails.groups)
module NengoWeb
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.generators do |g|
      g.test_framework false
      g.factory_girl false
    end

    config.time_zone = "Tokyo"
  end

end
