source 'http://rubygems.org'

gem 'newrelic_rpm'
gem "rack-jekyll"

# Heroku hack
if RUBY_PLATFORM =~ /darwin/
  gem 'RedCloth'
  gem 'jekyll',    :git => 'git://github.com/thibaudgg/jekyll.git', :branch => 'no-server'
  gem 'jekyll_ext'  # for ejekyll
  
  gem 'aws-s3'
end