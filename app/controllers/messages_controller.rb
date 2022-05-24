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
    @message.reverse_message = @message.reverse_playback_text

      if @message.save
        redirect_to message_path(@message)
      else
        flash.now[:alert] = "「ひらがな」だけで入力してね！<br>※空白も削除してね！"
        render :new
      end
  end

  private
  def message_params
    params.require(:message).permit(:uuid, :message)
  end
end

