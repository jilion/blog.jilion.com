source 'http://rubygems.org'

ruby '1.9.3'

gem 'rake'
gem 'bundler'

gem 'jekyll'
gem 'jekyll_ext' # for ejekyll
gem 'rack-jekyll', github: 'adaoraul/rack-jekyll', require: 'rack/jekyll'

gem 'RedCloth'

group :production, :staging do
  gem 'thin'
end

group :assets do
  gem 'aws-s3'
  gem 'jammit'
  gem 'uglifier'
end

group :development do
  gem 'heroku'
  gem 'powder'
end
