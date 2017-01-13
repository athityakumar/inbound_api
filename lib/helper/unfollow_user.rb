class InboundAPI::UnfollowUser
  def unfollow_user userid , scraper
    begin
      scraper.get("https://inbound.org/members/follow?user_id=#{userid}&follow=0")
      return {"response" => "Success"}
    rescue
      return {"response" => "Failure"}
    end
  end
end  

require 'mechanize'