module Jekyll
  
  module Filters
    
    def rack_env(id)
      ENV['RACK_ENV']
    end
    
    def timestamp(id)
      ENV['TIMESTAMP']
    end
    
  end
  
end