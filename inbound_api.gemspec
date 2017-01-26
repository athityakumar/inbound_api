Gem::Specification.new do |s|
  s.name        = 'inbound_api'
  s.version     = '1.0.3'
  s.date        = '2017-01-12'
  s.summary     = "A Ruby Gem API for Inbound.org platform implemented with custom web scraping."
  s.description = "A Ruby Gem API for Inbound.org platform implemented with custom web scraping. Have a look at the documentation, to get started."
  s.authors     = ["Athitya Kumar",""]
  s.email       = ["athityakumar@gmail.com"]
  s.files       = ["lib/inbound_api.rb","lib/helper/login.rb","lib/helper/follow_user.rb","lib/helper/unfollow_user.rb","lib/helper/fetch_user_data.rb","lib/helper/fetch_followers.rb","lib/helper/fetch_following.rb","lib/helper/search_users.rb"]
  s.add_runtime_dependency 'mechanize', '~> 2.7.5', '>= 2.7.4'
  s.add_runtime_dependency 'json', '~> 2.0.3', '>= 2.0.1'
  s.homepage    = 'http://rubygems.org/gems/inbound_api'
  # s.extra_rdoc_files = ['Documentation', 'https://athityakumar.github.io/blog/posts/Inbound_API_Gem/index.html']
  s.license     = 'MIT'
end