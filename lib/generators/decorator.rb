require 'padrino-gen/generators/actions'

module Padrino
  module Generators
    ##
    # Responsible for the generating decorators and associated tests within a Padrino application.
    #
    class Decorator < Thor::Group

      # Add this generator to our padrino-gen
      Padrino::Generators.add_generator(:decorator, self)

      # Define the source template root
      def self.source_root; File.expand_path(File.dirname(__FILE__)); end
      # Defines the banner for this CLI generator
      def self.banner; "padrino-gen decorator [name]"; end

      # Include related modules
      include Thor::Actions
      include Padrino::Generators::Actions

      desc "Description:\n\n\tpadrino-gen decorator generates a new Padrino decorator"

      argument     :name,      :desc => 'The name of your padrino decorator'
      class_option :root,      :desc => 'The root destination',                   :aliases => '-r', :default => '.',    :type => :string
      class_option :app,       :desc => 'The application destination path',       :aliases => '-a', :default => '/app', :type => :string
      class_option :destroy,                                                      :aliases => '-d', :default => false,  :type => :boolean
      class_option :namespace, :desc => 'The name space of your padrino project', :aliases => '-n', :default => '',     :type => :string

      # Show help if no argv given
      require_arguments!

      # Execute decorator generation
      #
      # @api private
      def create_decorator
        self.destination_root = options[:root]

        if in_app_root?
          app = options[:app]
          check_app_existence(app)
          inject_into_file(destination_root(app, "app.rb"), "    register Padrino::Decorator::Helpers\n", :after => "Padrino::Application\n")
          self.behavior = :revoke if options[:destroy]
          @object_name    = name.to_s.underscore
          template 'templates/decorator.rb.tt', destination_root(app, 'decorators', "#{@object_name}_decorator.rb")
          if test?
            choice = fetch_component_choice(:test)
            apply_test_component_for_decorator_by choice
            generate_decorator_test(name)
          end
        else
          say 'You are not at the root of a Padrino application! (config/boot.rb not found)'
        end
      end

    end # Decorator

    module Actions

      def apply_test_component_for_decorator_by(choice)
        path = File.expand_path(File.dirname(__FILE__) + "/components/tests/#{choice}.rb")
        say_status :apply, "tests/#{choice}"
        shell.padding += 1
        instance_eval(File.read(path))
        shell.padding -= 1
      end

    end # Actions

  end # Generators
end # Padrino
