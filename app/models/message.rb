class Message < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1, maximum: 30 }
  HIRAGANA_REGEXP = /\A[ぁ-んー－]+\z/
  validates :message, format: { with: HIRAGANA_REGEXP }
  validates :reverse_message, presence: true, length: { minimum: 1, maximum: 100 }
  
  def to_param
    uuid
  end
end
