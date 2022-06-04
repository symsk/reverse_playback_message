require 'rails_helper'

RSpec.describe "Messages", type: :system do
  describe "正常系" do
    context "メッセージが1文字以上のひらがなで入力されている時" do
      it "共有ページで逆再生された文字列が表示される" do
        visit new_message_path
        fill_in "text-area", with: "よろしく"
        click_button "保存して共有ページへ"
        message = Message.new(uuid: SecureRandom.uuid)
        expect(message_path(message)).to eq message_path(message)
        expect(page).to have_content "うきひそろゆ"
      end
    end
  end

  describe "異常系" do
    context "メッセージが数字で入力されている時" do
      it "エラーメッセージが表示される" do
        visit new_message_path
        fill_in "text-area", with: "12345"
        click_button "保存して共有ページへ"
        message = Message.new(message: "", reverse_message: "")
        message.valid?
        expect(message.errors.full_messages).to include("Messageは不正な値です")
      end
    end
  end
end
