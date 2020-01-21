class Message < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  validates :content, presence: true, length: {minimum: 2}
end
