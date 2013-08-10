ENV['PADRINO_ENV'] = 'test'
PADRINO_ROOT = File.dirname(__FILE__) unless defined? PADRINO_ROOT

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', '..','lib'))
require 'rack/test'
require File.expand_path("#{File.dirname(__FILE__)}/mini_shoulda")
require 'padrino-helpers'
require 'padrino-decorator'
require 'turn'

class MiniTest::Spec
  include Rack::Test::Methods
end
