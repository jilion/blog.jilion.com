module Jekyll
  
  module Filters
    
    def pretty_url(url)
      case ENV['RACK_ENV']
      when 'production'
        url.gsub! /\/$/, ''
        'http://blog.jilion.com' + url
      when 'staging'
        url.gsub! /\/$/, ''
        'http://blogjilion-staging.heroku.com' + url
      else
        'http://localhost:4000' + url
      end
    end
    
  end
  
end
