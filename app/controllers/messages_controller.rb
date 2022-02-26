class MessagesController < ApplicationController
  def show
    @message = Message.find_by(uuid: params[:uuid])
    @url = request.url
  end

  def new
    @message= Message.new
  end

  def create
    @message = Message.new(message_params.merge(uuid: SecureRandom.uuid))
    mecab = MeCab::Tagger.new("-Oyomi")
    @message.message = mecab.parse(@message.message)
    @message.reverse_message = @message.message.to_roman.reverse.
      gsub(/!|！|g$|m|t|y$|h$|b$|n|/, 
        "!|！" => "", 
        "g" => "gu", 
        "m" => "mu", 
        "t" => "tu", 
        "y" => "yu",
        "h" => "ti",
        "b" => "bu",
        "n" => "nn",
      ).to_kana.
      gsub(/g|r|k|h|ぢ|s|/,
        "g" => "ぐ", 
        "r" => "る",
        "k" => "く",
        "h" => "ひ",
        "ぢ" => "でぃ",
        "s" => "す",
      ).delete("a""b""c""d""e""f""g""h""i""j""k""l""m""n""o""p""q""r""s""t""u""v""w""x""y""z")

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
