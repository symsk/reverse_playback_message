class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :answer
      t.string :reverse_voice

      t.timestamps
    end
  end
end
