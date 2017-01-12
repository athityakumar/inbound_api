class InboundAPI::FollowUser
  def follow_user userid , scraper
    scraper.get("https://inbound.org/members/follow?user_id=#{userid}&follow=1")
  end
end  

require 'mechanize'