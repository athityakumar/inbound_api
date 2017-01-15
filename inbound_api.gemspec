Gem::Specification.new do |s|
  s.name        = 'inbound_api'
  s.version     = '1.0.3'
  s.date        = '2017-01-12'
  s.summary     = "A Ruby Gem API for Inbound.org platform implemented with custom web scraping."
  s.description = "A Ruby Gem API for Inbound.org platform implemented with custom web scraping."
  s.authors     = ["Athitya Kumar"]
  s.email       = 'athityakumar@gmail.com'
  s.files       = ["lib/inbound_api.rb","lib/helper/login.rb","lib/helper/follow_user.rb","lib/helper/unfollow_user.rb","lib/helper/fetch_user_data.rb","lib/helper/fetch_followers.rb","lib/helper/fetch_following.rb"]
  s.homepage    = 'http://rubygems.org/gems/inbound_api'
  s.license     = 'MIT'
end