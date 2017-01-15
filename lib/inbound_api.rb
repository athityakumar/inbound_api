class InboundAPI
  # class << self
    def initialize
      @scraper = Mechanize.new do |a|
        a.follow_meta_refresh = true
        a.user_agent_alias = "Mac Safari 4"
        a.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      @root_url = "https://inbound.org/"
      @search_members_url = "https://inbound.org/members/?query=shah"
      @member_root_url = "https://inbound.org/in/"
      @search_posts_url = ""
      @followers_url = "/followers/"
      @following_url = "/following/"
      @login_post_url = "https://inbound.org/authenticate/check"
      @login_url = "https://inbound.org/login"
      @follow_user_url = "https://inbound.org/members/follow?follow=1&user_id="
      @unfollow_user_url = "https://inbound.org/members/follow?follow=0&user_id="
    end

    def login credentials={}
      client = Login.new()
      output = client.login(credentials)
      @scraper = (output["response"] == "Success") ? output["agent"] : @scraper
      return {"response" => output["response"]}
    end

    def fetch_user_data username=""
      client = FetchUserData.new()
      data = client.fetch_user_data(username)
      return data
    end

    def fetch_followers username=""
      client = FetchFollowers.new()
      data = client.fetch_followers(username)
      return data
    end

    def fetch_following username=""
      client = FetchFollowing.new()
      data = client.fetch_following(username)
      return data
    end

    # def search_users query={},traverse_pagination=false
    #   client = SearchUsers.new()
    #   data = client.search_users(query,traverse_pagination)
    #   return data
    # end

    def follow_user username=""
      client = FollowUser.new()
      userid = fetch_user_data(username)[:userid]
      return client.follow_user(userid,@scraper)
    end

    def unfollow_user username=""
      client = UnfollowUser.new()
      userid = fetch_user_data(username)[:userid]
      return client.unfollow_user(userid,@scraper)
    end


  # end
end


# Require other helper files too, and also add them to .gemspec file
require_relative 'helper/login'
require_relative 'helper/fetch_user_data'
require_relative 'helper/fetch_followers'
require_relative 'helper/fetch_following'
# require_relative 'helper/search_users'
require_relative 'helper/follow_user'
require_relative 'helper/unfollow_user'
require 'mechanize'