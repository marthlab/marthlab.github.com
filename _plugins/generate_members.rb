module Jekyll

  # Extensions to the Jekyll Site class.

  class Site
  
    # Get all member
    def members
        self.pages.select {|p| p.data['layout'] == 'member'}
    end
  
    # Add some custom options to the site payload, accessible via the
    # "site" variable within templates.
    #
    # members - members, in random order
    alias orig_site_payload site_payload
    def site_payload
        h = orig_site_payload
        payload = h["site"]
        payload["members"] = members
        h["site"] = payload
        h
    end
  
  end
end
