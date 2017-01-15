class FetchFollowers < InboundAPI
  
  def fetch_followers username

    url = "#{@member_root_url}#{username}#{@followers_url}"
    begin
      page = @scraper.get(url)

      begin
        followers = []
        elements = page.search(".user-details a")
        elements.each do |element|
          followers.push(element["href"].gsub(@member_root_url,""))
        end
      rescue
        followers = nil
      end


      return {
        response: "Success",
        followers: followers
      }
    rescue
      return {
        response: "Failure"
      }

    end
  end
end  

require 'mechanize'