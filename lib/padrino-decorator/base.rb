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

      def initialize(model, context)
        @model = model
        @context = context
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

      def h
        @context
      end

    end # Base

  end # Decorator
end # Padrino
