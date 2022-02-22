class Message < ApplicationRecord
  def to_param
    uuid
  end
end
