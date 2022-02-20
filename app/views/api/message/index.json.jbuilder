json.array! @message do |message|
  json.uuid message.uuid
  json.reverse_message message.reverse_message
  # json.reverse_message message.reverse_message&.to_s
end