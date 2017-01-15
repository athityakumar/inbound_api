class FollowUser < InboundAPI
  def initialize
    @follow_user_url = "https://inbound.org/members/follow?follow=1&user_id="
  end
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