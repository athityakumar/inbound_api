class InboundAPI
    def initialize
      @scraper = Mechanize.new do |a|
        a.follow_meta_refresh = true
        a.user_agent_alias = "Mac Safari 4"
        a.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      @root_url = "https://inbound.org/"
      @search_members_api_url = "https://api.inbound.org/users?order=trending&"
      @member_root_url = "https://inbound.org/in/"
      @search_posts_url = ""
      @followers_url = "/followers/"
      @following_url = "/following/"
      @login_post_url = "https://inbound.org/authenticate/check"
      @login_url = "https://inbound.org/login"
      @follow_user_url = "https://inbound.org/members/follow?follow=1&user_id="
      @unfollow_user_url = "https://inbound.org/members/follow?follow=0&user_id="
      @badges = JSON.parse(@scraper.get("https://api.inbound.org/badges").body)["data"]
      @skills = JSON.parse(@scraper.get("https://api.inbound.org/skills").body)["data"]
    end

    def login email , password
      client = Login.new()
      output = client.login({"email" => email, "password" => password})
      @scraper = (output["response"] == "Success") ? output["agent"] : @scraper
      sleep 3
      return {"response" => output["response"]}
    end

    def get_all_badges 
      return @badges
    end

    def get_all_skills
      return @skills
    end

    def fetch_user_data username=""
      client = FetchUserData.new()
      data = client.fetch_user_data(username)
      sleep 3
      return data
    end

    def fetch_followers username=""
      client = FetchFollowers.new()
      data = client.fetch_followers(username)
      sleep 3
      return data
    end

    def fetch_following username=""
      client = FetchFollowing.new()
      data = client.fetch_following(username)
      sleep 3
      return data
    end

    def search_users query="" , location="" , badges=[] , skills=[] , pages = 1
      client = SearchUsers.new()
      query_url = @search_members_api_url 
      query_url = client.get_url_from_string(query,query_url)
      query_url = client.get_url_from_string(location,query_url)
      query_url = client.get_url_from_list(@badges,badges,query_url)
      query_url = client.get_url_from_list(@skills,skills,query_url)
      data = client.search_users(@scraper,query_url,pages)
      sleep 3
      return data
    end

    def follow_user username=""
      client = FollowUser.new()
      userid = fetch_user_data(username)[:userid]
      sleep 3
      return client.follow_user(userid,@scraper)
    end

    def unfollow_user username=""
      client = UnfollowUser.new()
      userid = fetch_user_data(username)[:userid]
      sleep 3
      return client.unfollow_user(userid,@scraper)
    end
end


# Require other helper files too, and also add them to .gemspec file
require_relative 'helper/login'
require_relative 'helper/fetch_user_data'
require_relative 'helper/fetch_followers'
require_relative 'helper/fetch_following'
require_relative 'helper/search_users'
require_relative 'helper/follow_user'
require_relative 'helper/unfollow_user'
require 'mechanize'
require 'json'