module Checkpoint
  def create_submission(checkpoint_id, body_options = {})
    enrollment_id = self.get_me[:current_enrollment][:id]
    body = { body: {checkpoint_id: checkpoint_id, enrollment_id: enrollment_id}.merge(body_options)}
    options = { headers: {"authorization": @auth_token }}.merge(body)
    
    response = Kele.post("#{@endpoint}/checkpoint_submissions", options)
    JSON.parse(response.body, { symbolize_names: true })
  end
end
