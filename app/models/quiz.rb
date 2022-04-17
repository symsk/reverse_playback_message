class Quiz < ApplicationRecord
  belongs_to :user, optional: true
  # mount_uploader :reverse_voice, ReverseVoiceUploader
  enum difficulty: { easy: 0, normal: 1, hard: 2 }
end
