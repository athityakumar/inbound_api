class InboundAPI
  
  def initialize hash={}
    puts hash.values
  end

  def self.login credentials
    client = Login.new()
    client.login(credentials)
  end

  def fetch_user_profile
  end

  def search_for_users
  end

  def follow
  end

  def unfollow
  end

end


# Require other helper files too, and also add them to .gemspec file
require_relative 'helper/login'