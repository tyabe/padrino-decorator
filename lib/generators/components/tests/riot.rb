RIOT_DECORATOR_TEST = (<<-TEST).gsub(/^ {10}/, '') unless defined?(RIOT_DECORATOR_TEST)
require File.expand_path(File.dirname(__FILE__) + '!PATH!/test_config.rb')

context "!NAME!Decorator" do
  context 'can construct a new instance' do
    setup do
      !NAME!Decorator.new("Sample", self)
    end

    asserts('returns the decorated object') { topic == "Sample" }
  end
end
TEST

def generate_decorator_test(name)
  contents = RIOT_DECORATOR_TEST.gsub(/!NAME!/, @object_name.camelize).gsub(/!DNAME!/, @object_name)
  path = options[:app] == '.' ? '/..' : '/../..'
  contents.gsub!(/!PATH!/, path)
  test_file_path = File.join('test', options[:app], 'decorators', "#{@object_name}_decorator_test.rb")
  create_file destination_root(test_file_path), contents, :skip => true
end
