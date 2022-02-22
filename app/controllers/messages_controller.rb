class MessagesController < ApplicationController
  def index; end

  def show
    @message = Message.find_by(uuid: params[:uuid])
  end

  def new
    @message= Message.new
  end

  def create
    @message = Message.new(message_params.merge(uuid: SecureRandom.uuid))
    mecab = MeCab::Tagger.new("-Oyomi")
    @message.message = mecab.parse(@message.message)
    @message.reverse_message = @message.message.to_roman.reverse.
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

      if @message.save
        redirect_to message_path(@message)
      else
        render root_path
      end
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
