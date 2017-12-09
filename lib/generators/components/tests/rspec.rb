RSPEC_DECORATOR_TEST = (<<-TEST).gsub(/^ {10}/, '') unless defined?(RSPEC_DECORATOR_TEST)
require 'spec_helper'

describe "!NAME!Decorator" do
  it 'can construct a new instance' do
    object = "Sample"
    @!DNAME! = !NAME!Decorator.new(object, context: self)
    expect(@!DNAME!).to eql object
  end
end
TEST

def generate_decorator_test(name)
  contents = RSPEC_DECORATOR_TEST.gsub(/!NAME!/, @object_name.camelize).gsub(/!DNAME!/, @object_name)
  test_file_path = File.join('spec', options[:app], 'decorators', "#{@object_name}_decorator_spec.rb")
  create_file destination_root(test_file_path), contents, :skip => true
end
