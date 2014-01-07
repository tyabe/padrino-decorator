module Padrino
  module Decorator
    VERSION = '0.0.2' unless defined?(Padrino::Decorator::VERSION)

    def self.version
      VERSION
    end
  end
end
