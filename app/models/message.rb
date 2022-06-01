class Message < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1, maximum: 50 }
  validates :message, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :reverse_message, presence: true, length: { minimum: 1, maximum: 100 }
  
  def to_param
    uuid
  end
end
