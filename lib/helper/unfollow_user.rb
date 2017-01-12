class InboundAPI::UnfollowUser
  def unfollow_user userid , scraper
    scraper.get("https://inbound.org/members/follow?user_id=#{userid}&follow=0")
  end
end  

require 'mechanize'