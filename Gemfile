source 'https://rubygems.org'

gemspec
gem 'rake'

group :development, :test do
  gem 'coveralls', :require => false
end

group :test do
  gem 'rack-test',  '>= 0.5.0'
  gem 'minitest',   '~> 4.0'
  gem 'mocha',      '>= 0.10.0'
  gem 'turn'
end

group :development do
  gem 'yard',       '>= 0.7.2'
  gem 'kramdown'
  gem 'github-markup'
end
