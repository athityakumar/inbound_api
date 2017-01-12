class InboundAPI::FetchUserData
  
  def fetch_user_data url , scraper

      page = scraper.get(url)

      # # Profile Related Info
      # profile_details = page.search('div.member-banner div.member')
      # # User ID
      # userid_ele = profile_details.at(".toggle-follow-user")
      userid = page.search(".toggle-follow-user").to_s.split("data-user-id")[1][2..8]

      # # Name
      # name_ele = profile_details.at("div.member-details h1")
      # name = name_ele.nil? ? nil : name_ele.text.strip
      # # Company and its link
      # company_link_ele = profile_details.at("div.member-banner-tagline p:nth-of-type(1) a")
      # if company_link_ele.nil?
      #   company, company_link = nil, nil
      # else
      #   company, company_link = company_link_ele.text, company_link_ele["href"]
      # end
      # # Image
      # image_ele = profile_details.at("img.avatar")
      # image = image_ele.nil? ? nil : image_ele["src"].strip
      # # Location
      # location_ele = profile_details.at("div.member-banner-tagline p:nth-of-type(2)")
      # location = location_ele.nil? ? nil : location_ele.text.strip.to_ascii.truncate(200)
      # # Title
      # title_ele = profile_details.at("div.member-banner-tagline p:nth-of-type(1)")
      # title = title_ele.nil? ? nil : title_ele.children.first.text.strip.gsub(" at", "").to_ascii.truncate(200)
      # # Karma
      # karma_ele = profile_details.at("span.karma")
      # karma = karma_ele.nil? ? nil : karma_ele.children.first.text.strip.delete(",").to_i
      # # Followers
      # followers = profile_details.at("ul > li.member-banner-followers-count a").children.first.text.strip.to_i
      # # Following
      # following = profile_details.at("ul > li.member-banner-following-count a").children.first.text.strip.to_i
      # # Twitter Link
      # tw_link_ele = profile_details.at("div.social-links i.fa-twitter")
      # tw_link = tw_link_ele.nil? ? nil : tw_link_ele.parent["href"]
      # # Facebook Link
      # fb_link_ele = profile_details.at("div.social-links i.fa-facebook")
      # fb_link = fb_link_ele.nil? ? nil : fb_link_ele.parent["href"]
      # # Linkedin Link
      # in_link_ele = profile_details.at("div.social-links i.fa-linkedin")
      # in_link = in_link_ele.nil? ? nil : in_link_ele.parent["href"]
      # # Google Plus Link
      # gplus_link_ele = profile_details.at("div.social-links i.fa-google-plus")
      # gplus_link = gplus_link_ele.nil? ? nil : gplus_link_ele.parent["href"]
      # # Website Link
      # web_link_ele = profile_details.at("div.social-links i.fa-link")
      # web_link = web_link_ele.nil? ? nil : web_link_ele.parent["href"]
      # # Badges
      # badges_ele = page.search("div.profile-summary-content span.karma_title")
      # if badges_ele.nil?
      #   number_badges, badges = nil, nil
      # else
      #   badges = badges_ele.map(&:text).map(&:to_s).map(&:strip)
      #   number_badges, badges = badges.count, badges.join(",")
      # end
      # # Recent Activity
      # recent_activity_ele = page.search("li.activity-row span.activity-list-submitted")
      # recent_activity = recent_activity_ele.blank? ? nil : recent_activity_ele.first.text.to_s.strip
      # unless recent_activity.blank?
      #   if recent_activity.ends_with?("ago")
      #     # eval() is a function in ruby used to execute the part of code
      #     recent_activity = eval(recent_activity.downcase.strip.gsub(" ", ".")).strftime('%b %d %Y')
      #   end
      # end
      # return all the data as hash
      return {
        userid: userid
        # name: name,
        # company: company,
        # company_link: company_link,
        # image_url: image,
        # location: location,
        # designation: title,
        # karma: karma,
        # number_followers: followers,
        # number_following: following,
        # twitter_link: tw_link,
        # facebook_link: fb_link,
        # linkedin_link: in_link,
        # googleplus_link: gplus_link,
        # my_link: web_link,
        # number_badges: number_badges,
        # badges: badges,
        # recent_activity: recent_activity
      }

 
  end
end  

require 'mechanize'