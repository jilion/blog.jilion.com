module Jekyll
  class Site

    # Add some custom options to the site payload, accessible via the
    # "site" variable within templates.
    alias orig_site_payload site_payload
    def site_payload
      h = orig_site_payload
      payload = h["site"]

      payload["tags_name"] = payload["tags"].keys.sort

      h["site"] = payload
      h
    end
  end
end