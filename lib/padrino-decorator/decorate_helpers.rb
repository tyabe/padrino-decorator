module Padrino
  module Decorator

    module DecorateHelpers
      def decorate(object, options = {})
        if object.respond_to?(:first)
          return [] if object.empty?
          klass_name = "#{object.first.class.to_s.pluralize}Decorator"
        else
          klass_name = "#{object.class}Decorator"
        end
        klass = options.fetch(:as) { klass_name.constantize }
        decorator = klass.new(object, self)

        yield decorator if block_given?
        decorator
      end
    end # DecorateHelpers

  end # Decorator
end # Padrino
