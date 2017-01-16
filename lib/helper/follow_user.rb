class FollowUser < InboundAPI
  def follow_user userid , scraper 
    begin  
      scraper.get("#{@follow_user_url}#{userid}")
      return {"response" => "Success"}
    rescue
      return {"response" => "Failure"}
    end
  end
end  

require 'mechanize'