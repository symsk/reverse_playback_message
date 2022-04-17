class RemoveReverseVoiceFromQuizzes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :reverse_voice, :string
  end
end
