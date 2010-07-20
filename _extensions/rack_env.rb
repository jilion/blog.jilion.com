module Jekyll
  
  module Filters
    
    def rack_env(id)
      ENV['RACK_ENV']
    end
    
  end
  
end