require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Promoove
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:fr, :en]

    # => This is an example of ALL available config options
    # => You're able to see exactly how it works here:
    # => https://github.com/richpeck/exception_handler/blob/master/lib/exception_handler/config.rb

    # => Config hash (no initializer required)
    config.exception_handler = {
      dev: true, # allows you to turn ExceptionHandler "on" in development
      db: nil, # allocates a "table name" into which exceptions are saved (defaults to nil)
      email: nil, # sends exception emails to a listed email (string // "you@email.com")

      exceptions: {

        :all => {
          layout: nil, # define layout
          notification: true
        }
      }
    }
  end
end