require 'rubygems'

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)

class CacheSettings
  def initialize(app, seconds)
    @app, @seconds = app, seconds
  end
  def call(env)
    res = @app.call(env)
    res[1]["Cache-Control"] = "max-age=#{@seconds}, public"
    # res[1]["Expires"] = (Time.now + @seconds).utc.rfc2822
    res
  end
end

if ENV['RACK_ENV'] == 'staging'
  # require 'rack-ssl-enforcer'
  require 'rack-private'
  
  # use Rack::SslEnforcer
  use Rack::Private, :code => ENV['PRIVATE_CODE']
else
  use CacheSettings, 31536000 # 1 year
end

require 'rack/jekyll'
run Rack::Jekyll.new