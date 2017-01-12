class InboundAPI::Login
  
    def initialize
      @agent = Mechanize.new do |a|
        a.follow_meta_refresh = true
        a.user_agent_alias = "Mac Safari 4"
        a.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      @root_url = "https://inbound.org/authenticate/check"

    end

    def login credentials={}

        begin
          @agent.post(@root_url, {
            email: credentials["email"],
            password: credentials["password"]
          })
          @agent.get("https://inbound.org/")
          puts "Posting to #{@root_url}."
          return @agent
        rescue
          return nil
        end

    end
end  

require 'json'
require 'mechanize'