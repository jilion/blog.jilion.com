module Jekyll

  module Filters

    def pretty_tag(tag)
      tag.gsub(/\s/, "-").gsub(/[^\w-]/, '').downcase
    end

  end

end
