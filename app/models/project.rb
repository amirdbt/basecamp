class Project < ApplicationRecord
  belongs_to :user
  has_many :project_users, dependent: :destroy
   has_many :users, through: :project_users
  has_many :topics, :dependent => :destroy
  has_many_attached :image, dependent: :destroy
  validates :name, presence: true
  validates :details, presence: true
end
