class InboundAPI
  # class << self
    def initialize
      @root_url = "https://inbound.org/"
      @scraper = Mechanize.new()
    end

    def login credentials={}
      client = Login.new()
      output = client.login(credentials)
      @scraper = (output["response"] == "Success") ? output["agent"] : Mechanize.new()
      return {"response" => output["response"]}
    end

    def fetch_user_data username=""
      client = FetchUserData.new()
      data = client.fetch_user_data("https://inbound.org/in/#{username}",@scraper)
      return data
    end

    # def search_users query={}


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
# require_relative 'helper/search_users'
require_relative 'helper/follow_user'
require_relative 'helper/unfollow_user'
require 'mechanize'