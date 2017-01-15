class FetchFollowing < InboundAPI
  
  def fetch_following username

    url = "#{@member_root_url}#{username}#{@following_url}"
    begin
      page = @scraper.get(url)

      begin
        following = []
        elements = page.search(".user-details a")
        elements.each do |element|
          following.push(element["href"].gsub(@member_root_url,""))
        end
      rescue
        following = nil
      end


      return {
        response: "Success",
        following: following
      }
    rescue
      return {
        response: "Failure"
      }

    end
  end
end  

require 'mechanize'