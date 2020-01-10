class User < ApplicationRecord
    has_many :projects, dependent: :destroy
    validates :password, confirmation: true,
                        length: {minimum: 8}
    validates :email,uniqueness: true, presence: true
    validates :password_confirmation, presence: true
end
