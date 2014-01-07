module Padrino
  module Decorator
    ##
    # Registers helpers into your application
    #
    # @param [Sinatra::Application] app
    #   The specified padrino application
    #
    # @example Register the helper module
    #   require 'padrino-decorator'
    #   class Padrino::Application
    #     register Padrino::Decorator::Helpers
    #   end
    #
    module Helpers
      class << self
        def registered(app)
          app.helpers Padrino::Decorator::DecorateHelpers
          app.load_paths << File.join(app.settings.root, 'decorators')
          decorators_path = File.join(app.settings.root, 'decorators/**/*.rb')
          Padrino.dependency_paths << decorators_path
          Padrino.require_dependencies(decorators_path)
        end
        alias :included :registered
      end
    end # Helpers

  end # Decorator
end # Padrino
