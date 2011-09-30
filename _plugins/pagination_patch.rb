module Jekyll

  class Pagination < Generator

    def paginate(site, page)
      all_posts = site.site_payload['site']['posts']
      pages = Pager.calculate_pages(all_posts, site.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Pager.new(site.config, num_page, all_posts, pages)
        page.pager = pager if num_page == 1
        newpage = Page.new(site, site.source, page.dir, page.name)
        newpage.pager = pager
        # =================================
        # = Monkey Patch pages path here! =
        # =================================
        newpage.dir = File.join(page.dir, "page/#{num_page}")
        site.pages << newpage
      end
    end

  end

end
