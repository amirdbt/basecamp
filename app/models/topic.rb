class Topic < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :name, presence: true
end
