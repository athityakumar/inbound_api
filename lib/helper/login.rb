class Login < InboundAPI
  
    def login credentials={}

        begin
          @scraper.post(@login_post_url, {
            email: credentials["email"],
            password: credentials["password"]
          })
          @scraper.get("https://inbound.org/")
          puts "Posting to #{@login_post_url}."
          if @scraper.get(@login_url).search(".modal-content .form-login").count == 0
            return {"response" => "Success" , "agent" => @scraper}
          else
            return {"response" => "Failure"}        
          end
        rescue
          return {"response" => "Failure"}
        end

    end
end  

require 'json'
require 'mechanize'