module Jekyll
  
  module Filters
    
    def date_to_pretty_string(date)
      date.strftime("%B #{ordinalize(date.day)}, %Y")
    end
    
  private
    
    def ordinalize(number)
      if (11..13).include?(number.to_i % 100)
        "#{number}th"
      else
        case number.to_i % 10
          when 1; "#{number}st"
          when 2; "#{number}nd"
          when 3; "#{number}rd"
          else    "#{number}th"
        end
      end
    end
    
  end
  
end