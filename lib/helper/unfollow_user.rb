class UnfollowUser < InboundAPI
  def unfollow_user userid , scraper
    begin
      scraper.get("#{@unfollow_user_url}#{userid}")
      return {"response" => "Success"}
    rescue
      return {"response" => "Failure"}
    end
  end
end  

require 'mechanize'