require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WagonTicketsPrl
  class Application < Rails::Application
    config.load_defaults 6.1

    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework false
    end
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
