class Quiz < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :reverse_voice, ReverseVoiceUploader
end
