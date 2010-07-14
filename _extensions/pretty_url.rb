module Jekyll
  
  module Filters
    
    def url_without_slash(url)
      url.gsub /\/$/, ''
    end
    
  end
  
end