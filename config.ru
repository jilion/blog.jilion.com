class CacheSettings
  def initialize(app, seconds)
    @app, @seconds = app, seconds
  end
  def call(env)
    res = @app.call(env)
    res[1]["Cache-Control"] = "max-age=#{@seconds}, public"
    res[1]["Expires"] = (Time.now + @seconds).utc.rfc2822
    res
  end
end

use CacheSettings, 31536000 # 1 year

require 'rack/jekyll'
run Rack::Jekyll.new
