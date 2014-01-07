require 'delegate'
module Padrino
  module Decorator
    class Base < SimpleDelegator

      class << self

        def decorate(name)
          define_method(name) do
            @model
          end
        end

      end # ClassMethods
      def initialize(model, options = {})
        @model = model
        @context = options[:context]
        super(model)
      end

      def to_model
        __getobj__
      end

      def class
        to_model.class
      end

      def kind_of?(klass)
        to_model.kind_of?(klass)
      end
      alias_method :is_a?, :kind_of?

      def instance_of?(klass)
        to_model.instance_of?(klass)
      end

      def decorated?
        true
      end

      private

      def self.context(context)
        _helper_method_name = :h
        define_method(_helper_method_name) do
          @context || context.to_s.camelize.constantize.new!
        end
        private _helper_method_name
      end

    end # Base

  end # Decorator
end # Padrino
