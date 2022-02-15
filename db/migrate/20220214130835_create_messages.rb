class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :uuid, null: false
      t.string :message
      t.string :reverse_message

      t.timestamps
    end
  end
end
