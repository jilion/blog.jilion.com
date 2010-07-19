module Jekyll
  
  module Filters
    
    def id_to_css_id(id)
      id.gsub /\D/, ''
    end
    
  end
  
end