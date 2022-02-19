class Api::MessageController < ApplicationController
  def index; end

  def create
    message = Message.new(message_params.merge(uuid: SecureRandom.uuid))
    mecab = MeCab::Tagger.new("-Oyomi")
    message.message = mecab.parse(message.message)
    message.reverse_message = message.message.to_roman.reverse.
      gsub(/!|！|g$|m|t|s|y$|h$|b$/, 
        "!|！" => "", 
        "g" => "gu", 
        "m" => "mu", 
        "t" => "tu", 
        "s" => "",
        "y" => "yu",
        "h" => "ti",
        "b" => "bu",
      ).to_kana

      if message.save
        render json: message
      else
        render json: message.errors, status: :bad_request
      end
  end

  private
  def message_params
    params.permit(:message)
  end
end
