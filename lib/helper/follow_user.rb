class InboundAPI::FollowUser
  def follow_user userid , scraper
    begin  
      scraper.get("https://inbound.org/members/follow?user_id=#{userid}&follow=1")
      return {"response" => "Success"}
    rescue
      return {"response" => "Failure"}
    end
  end
end  

require 'mechanize'