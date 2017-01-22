class SearchUsers < InboundAPI

  def get_url_from_string string , query_url
    if string != ""
      string=string.split(" ").join("+")
      query_url = query_url + "query=" + string + "&"
    end
    return query_url
  end

  def get_url_from_list source_list , search_list , query_url
    source_list.each do |s|
      search_list.each do |l|
        if s["name"] == l || s["slug"] == l
          query_url = query_url + "skills%5B%5D=" + s["id"] + "&"
        end
      end
    end
    return query_url
  end

  def search_users_page scraper , query_url
    page = scraper.get(query_url)
    object = JSON.parse(page.body)
    usernames = object["data"].map {|o| o["username"]}
    usernames.keep_if {|u| !u.nil? }
    return usernames
  end

  def search_users scraper , query_url , pages = 1
    begin
      list = []
      n_pages = JSON.parse(scraper.get(query_url).body)["meta"]["pagination"]["total_pages"]
      if pages < 1 || pages > n_pages
        pages = n_pages
      end
      for i in (1..pages)
        list = list + search_users_page(scraper,"#{query_url}page=#{i.to_s}")
      end
      return {
        "response" => "Success",
        "usernames" => list
      }
    rescue Exception => e
      return {
        "response" => "Error #{e}"
      }
    end
  end
end  

require 'mechanize'
require 'json'