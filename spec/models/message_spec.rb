require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "正常系" do
    context "メッセージが1文字以上のひらがなで入力されている時" do
      it "バリデーションを通過すること" do
        message = Message.new(message: "よろしく", reverse_message: "うきひそろゆ")
        expect(message).to be_valid
      end
    end

    context "メッセージが50文字のひらがなで入力されている時" do
      it "バリデーションを通過すること" do
        message = Message.new(message: "あ" * 50, reverse_message: "あ" * 50)
        expect(message).to be_valid
      end
    end
  end

  describe "異常系" do
    context "メッセージが空白の時" do
      it "メッセージの作成が失敗する" do
        message = Message.new(message: "", reverse_message: "")
        message.valid?
        expect(message.errors.full_messages).to include("Messageを入力してください", "Messageは1文字以上で入力してください")
      end
    end

    context "メッセージが1文字以上のカタカナで入力されている時" do
      it "メッセージの作成が失敗する" do
        message = Message.new(message: "ヨロシク", reverse_message: "")
        message.valid?
        expect(message.errors.full_messages).to include("Messageは不正な値です")
      end
    end

    context "メッセージが1文字以上のローマ字で入力されている時" do
      it "メッセージの作成が失敗する" do
        message = Message.new(message: "yoroshiku", reverse_message: "")
        message.valid?
        expect(message.errors.full_messages).to include("Messageは不正な値です")
      end
    end
  end
end
