require 'httparty'
require 'json'
require './lib/roadmap'
class Kele
  include HTTParty
  include Roadmap
  def initialize(email, password)
    @endpoint = 'https://www.bloc.io/api/v1'
    response = Kele.post( "#{@endpoint}/sessions", body: { email: email, password: password } )
    if response && response["auth_token"]
      @auth_token = response["auth_token"]
    else
      puts "Login invalid"
    end
  end

  def get_mentor_availability(mentor_id)
    response = Kele.get( "#{@endpoint}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    JSON.parse(response.body, { symbolize_names: true })
  end

  def get_me
    response = Kele.get("#{@endpoint}/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body, { symbolize_names: true })
  end
end
