SHOULDA_DECORATOR_TEST = (<<-TEST).gsub(/^ {10}/, '') unless defined?(SHOULDA_DECORATOR_TEST)
require File.expand_path(File.dirname(__FILE__) + '!PATH!/test_config.rb')

class !NAME!DecoratorTest < Test::Unit::TestCase
  context "!NAME! Decorator" do
    should 'construct a new instance' do
      object = "Sample"
      @!DNAME! = !NAME!Decorator.new(object, self)
      assert_equal @!DNAME!, object
    end
  end
end
TEST

def generate_decorator_test(name)
  contents = SHOULDA_DECORATOR_TEST.gsub(/!NAME!/, @object_name.camelize).gsub(/!DNAME!/, @object_name)
  path = options[:app] == '.' ? '/..' : '/../..'
  contents.gsub!(/!PATH!/, path)
  test_file_path = File.join('test', options[:app], 'decorators', "#{@object_name}_decorator_test.rb")
  create_file destination_root(test_file_path), contents, :skip => true
end
