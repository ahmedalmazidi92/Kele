module Roadmap
  def get_roadmap(roadmap_id)
    response = Kele.get( "#{@endpoint}/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body, { symbolize_names: true })
  end

  # def get_checkpoint(checkpoint_id)
  #   response = Kele.get( "#{@endpoint}/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token })
  #   JSON.parse(response.body, { symbolize_names: true })
  # end
end
