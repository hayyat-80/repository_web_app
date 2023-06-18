class User < ApplicationRecord
    has_secure_password

    has_many :user_repos, dependent: :destroy
    has_many :repositories, :through => :user_repos

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password, length: { minimum: 8 }
end
