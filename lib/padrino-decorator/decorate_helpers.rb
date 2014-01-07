module Padrino
  module Decorator

    module DecorateHelpers
      def decorate(object, options = {})

        klass = options[:as]

        if object.respond_to?(:first)
          return [] if object.empty?
          klass_name = "#{object.first.class}Decorator"
          klass = klass_name.constantize if klass.nil?
          decorator = object.map{|o| klass.new(o, context: self)}
        else
          klass_name = "#{object.class}Decorator"
          klass = klass_name.constantize if klass.nil?
          decorator = klass.new(object, context: self)
        end

        yield decorator if block_given?
        decorator
      end
    end # DecorateHelpers

  end # Decorator
end # Padrino
