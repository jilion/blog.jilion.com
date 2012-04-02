module Jekyll
  
  module Filters
    
    def pretty_url(url)
      case ENV['RACK_ENV']
      when 'production'
        url.gsub! /\/$/, ''
        'http://blog.jilion.com' + url
      when 'staging'
        url.gsub! /\/$/, ''
        'http://jilion-blog-staging.heroku.com' + url
      else
        'http://localhost:4000' + url
      end
    end
    
    def pretty_tag_url(tag)
      pretty_url("/tags/#{pretty_tag(tag)}")
    end
    
  end
  
end
