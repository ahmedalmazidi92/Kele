module Messaging
  def get_messages(page = nil)
    options = { headers: { "authorization": @auth_token }}
    options.merge({ body: { page: page }}) unless page.nil?

    response = Kele.get("#{@endpoint}/message_threads", options)
    JSON.parse(response.body, { symbolize_names: true })
  end

  def create_message(sender, recipient_id, stripped_text, body_options = {} )
    body =  { body: {sender: sender, recipient_id: recipient_id, "stripped-text": stripped_text }.merge(body_options)}
    options = { headers: { "authorization": @auth_token }}.merge(body)
    response = Kele.post("#{@endpoint}/messages", options)
    case response.code
      when 200
        puts "Successfully sent message"
      else
        puts "Message did not get sent"
    end
  end
end
