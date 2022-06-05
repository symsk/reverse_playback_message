require 'rails_helper'

RSpec.describe "Quizzes", type: :system do
  describe "正常系" do
    context "ログインしている時のみ" do
      it "クイズ作成ページにアクセスができること" do
        user = User.new(email: "user@example.com", password: "password")
        visit new_quiz_path
      end
    end
  end

  describe "異常系" do
    context "ログインしていない時" do
      it "トップページに遷移する" do
        visit new_quiz_path
        expect(current_path).to eq root_path
      end
    end
  end
end
