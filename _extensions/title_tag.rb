module Jekyll

  TITLE_TAGS = ['SublimeVideo Showcase', 'SublimeVideo in Education', 'SublimeVideo in Production']
  SUB_TITLE_TAGS = ['SublimeVideo in Education', 'SublimeVideo in Production']

  module Filters

    def titles_tag(tags)
      tags.reverse.detect { |tag| TITLE_TAGS.any? { |t| t == tag } }
    end
    
    def titles_link_tag(tags)
      (tags - SUB_TITLE_TAGS).reverse.detect { |tag| TITLE_TAGS.include?(tag) }
    end

  end

end
