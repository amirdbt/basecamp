class User < ApplicationRecord
    has_many :projects, dependent: :destroy
    has_many :project_users
    has_many :topics
    # has_many :projects, through: :project_users
    validates :password, confirmation: true,
                        length: {minimum: 8}
    validates :email,uniqueness: true, presence: true
    validates :password_confirmation, presence: true
end
