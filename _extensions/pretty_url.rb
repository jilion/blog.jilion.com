module Jekyll
  
  module Filters
    
    def pretty_url(url)
      if ENV['RACK_ENV'] == 'production'
        url.gsub! /\/$/, ''
        'http://blog.jilion.com' + url
      else
        'http://localhost:4000' + url
      end
    end
    
  end
  
end