class InboundAPI::FetchUserData
  
  def fetch_user_data url , scraper

    begin
      page = scraper.get(url)

      userid = page.search(".toggle-follow-user")[0]["data-user-id"]

      begin
        fullname = page.search('.member-details h1')[0].children.text.to_s
      rescue
        fullname = nil
      end

      begin
        karma = page.search('.user-stats .number')[0].text.to_i
      rescue
        karma = nil 
      end

      begin
        followers = page.search('.user-stats .number')[1].text.to_i
      rescue 
        followers = nil
      end

      begin
        following = page.search('.user-stats .number')[2].text.to_i
      rescue
        following = nil 
      end

      begin
        company = page.search("div.member-banner-details p:nth-of-type(1) a")[0].parent.text.strip.chomp.gsub("\n"," ").gsub("\t"," ")
      rescue
        company = nil 
      end

      begin
        company_link = page.search("div.member-banner-details p:nth-of-type(1) a")[0]["href"]
      rescue
        company_link = nil 
      end

      begin
        image = page.search(".member-banner .avatar img")[0]["src"]
      rescue
        image = nil
      end

      begin
        location = page.search("div.member-banner-details p:nth-of-type(2)")[0].text.strip
      rescue
        location = nil 
      end

      begin
        tw_link = page.search(".member .twitter")[0]["href"]
      rescue
        tw_link = nil 
      end

      begin
        in_link = page.search(".member .linkedin")[0]["href"]
      rescue 
        in_link = nil
      end

      begin
        fb_link = page.search(".member .facebook")[0]["href"]
      rescue 
        fb_link = nil
      end

      begin
        gplus_link = page.search(".member .google-plus")[0]["href"]
      rescue
        gplus_link = nil 
      end

      begin
        web_link = page.search('.fa-link')[0].parent["href"]
      rescue
        web_link = nil 
      end

      begin
        badge_wrapper , badges = page.search('.badges li') , []
        badge_wrapper.each do |badge|
          badges.push(badge.search('.karma_title').text.strip)
        end
        number_badges = badges.count
      rescue 
        badges = nil
        number_badges = nil
      end
      begin
        recent_activity = page.search('.activity-list-submitted').first.text[2..-1]
      rescue 
        recent_activity = nil
      end

      return {
        response: "Success",
        userid: userid,
        name: fullname,
        image_url: image,
        location: location,
        karma: karma,
        number_followers: followers,
        number_following: following,
        work: company,
        company_link: company_link,
        twitter_link: tw_link,
        facebook_link: fb_link,
        linkedin_link: in_link,
        googleplus_link: gplus_link,
        my_link: web_link,
        number_badges: number_badges,
        badges: badges,
        recent_activity: recent_activity
      }
    rescue
      return {
        response: "Failure"
      }

    end
  end
end  

require 'mechanize'