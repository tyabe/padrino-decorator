require 'padrino-decorator/version'
require 'padrino-decorator/base'
require 'padrino-decorator/helpers'
require 'padrino-decorator/decorate_helpers'

##
# We add our generators to Padrino::Generators
#
begin
  require 'padrino-gen'
  Padrino::Generators.load_paths << Dir[File.dirname(__FILE__) + '/generators/{decorator}.rb']
rescue LoadError
  # Fail silently
end
