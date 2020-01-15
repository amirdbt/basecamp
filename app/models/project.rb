class Project < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  validates :name, presence: true
  validates :details, presence: true
end
