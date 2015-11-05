require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TCCVidasaudavel
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    config.active_record.raise_in_transactional_callbacks = true
    config.i18n.default_locale = :pt
    require Rails.root.join("lib/custom_public_exceptions")
    config.exceptions_app = CustomPublicExceptions.new(Rails.public_path)
  end
end
