class Project < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :details, presence: true
end
