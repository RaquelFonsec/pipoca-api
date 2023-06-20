require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PipocaApi
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
# config/application.rb

module YourAppName
  class Application < Rails::Application
    # ...

    # Permitir todos os hosts para o ambiente de desenvolvimento
    config.hosts.clear if Rails.env.development?

    # Permitir todos os hosts para o ambiente de teste
    config.hosts.clear if Rails.env.test?

    # Adicionar o host ":" para todos os outros ambientes
    config.hosts << ":"

    # ...
  end
end
