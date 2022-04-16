class AddColumnsToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :question, :string
    add_column :quizzes, :difficulty, :integer, null: false, default: 0
  end
end
