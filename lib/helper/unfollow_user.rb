class UnfollowUser < InboundAPI
  def initialize
    @unfollow_user_url = "https://inbound.org/members/follow?follow=0&user_id="
  end

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