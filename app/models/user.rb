class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :quiz, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
