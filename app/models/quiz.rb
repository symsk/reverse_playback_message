class Quiz < ApplicationRecord
  belongs_to :user
  enum difficulty: { easy: 0, normal: 1, hard: 2 }
end
