class InboundAPI::Searchusers
  def search_users search_query

      crawl_done = iterate_search_page ENV["CRAWL_URL"]
  page = $scraper.get(search_page)
        user_profile_links = page.links_with(class: "avatar", href: %r{https://inbound.org/in/}).map(&:href)
        user_profile_links.each do |inbound_link|
          # If user not already in our crm, Add it to crm.
          # Otherwise Update it
          inbound_user = InboundUser.find_by(inbound_link: inbound_link)
          # Hash of inbound user data
          puts "Crawling Profile ...: #{inbound_link.to_s}"
          profile = $scraper.get(inbound_link)
          inbound_user_data = get_inbound_user_data profile
          if inbound_user.blank?
            InboundUser.create(inbound_user_data.merge(inbound_link: inbound_link))
          else
            inbound_user.update(inbound_user_data)
          end
        end
        # Check if next page exist
        next_search_page = next_page(page)
        puts "Next page: #{next_search_page.to_s}"
        if next_search_page.nil?
          return true
        else
          puts "Recursive Iteration ...\n"
          puts "Sleep for 10 seconds."
          sleep 10
          puts "Proceeding next page crawling..."
          iterate_search_page next_search_page
        end


  end
end  

require 'mechanize'