source 'http://rubygems.org'

ruby '1.9.3'

gem 'rake'
gem 'bundler'

gem 'jekyll',            '~> 0.11.2'
gem 'jekyll_ext',        '~> 0.1.4'  # for ejekyll
gem 'rack-jekyll', github: 'adaoraul/rack-jekyll', require: 'rack/jekyll'

gem 'RedCloth',          '~> 4.2.9'

group :production, :staging do
  gem 'thin'
end

group :assets do
  gem 'aws-s3', '0.6.2'
  gem 'jammit'
  gem 'uglifier'
end

group :development do
  gem 'heroku'
  gem 'powder'
end
