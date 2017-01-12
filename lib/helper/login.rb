class InboundAPI::Login
  
  def initialize credentials=""
    @credentials = credentials
  end

  def login credentials
    puts credentials
  end
end  