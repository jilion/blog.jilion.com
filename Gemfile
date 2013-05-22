source 'https://rubygems.org'

ruby '2.0.0'

gem 'bundler'

gem 'jekyll'
gem 'jekyll_ext' # for ejekyll
gem 'rack-jekyll'
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
  gem 'powder'
end
