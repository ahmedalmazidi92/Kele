require 'httparty'
require 'json'
class Kele
  include HTTParty
  def initialize(email, password)
    @endpoint = 'https://www.bloc.io/api/v1'
    response = Kele.post( "#{@endpoint}/sessions", body: { email: email, password: password } )
    if response && response["auth_token"]
      @auth_token = response["auth_token"]
    else
      puts "Login invalid"
    end
  end

  def get_me
    response = Kele.get("#{@endpoint}/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body, { symbolize_names: true })
  end
end
