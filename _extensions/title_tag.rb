module Jekyll

  TITLE_TAGS = ['SublimeVideo Showcase', 'SublimeVideo in Education']

  module Filters

    def titles_tag(tags)
      tags.reverse.detect { |tag| TITLE_TAGS.include?(tag) }
    end

  end

end
