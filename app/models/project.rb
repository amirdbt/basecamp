class Project < ApplicationRecord
  belongs_to :user
  has_many :project_users
   has_many :users, through: :project_users
  has_many :topics
  has_many_attached :image
  validates :name, presence: true
  validates :details, presence: true
end
