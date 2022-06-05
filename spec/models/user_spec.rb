require 'rails_helper'

RSpec.describe User, type: :model do
  describe "正常系" do
    context "emailとpasswordが存在する時" do
      it "userが正常に作成されること" do
        user = User.new(email: "user@example.com", password: "password")
        expect(user).to be_valid
      end
    end
  end

  describe "異常系" do
    context "emailとpasswordが空の時" do
      it "userが作成されないこと" do
        user = User.new(email: "", password: "")
        user.valid?
        expect(user.errors.full_messages).to include("Emailを入力してください", "Passwordを入力してください")
      end
    end
  end
end
