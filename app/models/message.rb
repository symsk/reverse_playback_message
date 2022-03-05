class Message < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1, maximum: 30 }
  validates :reverse_message, presence: true, length: { minimum: 1, maximum: 40 }
  
  def to_param
    uuid
  end
end
