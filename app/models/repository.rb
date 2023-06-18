class Repository < ApplicationRecord
    has_many :user_repos, dependent: :destroy
    has_many :users, :through => :user_repos

    validates :name, presence: true
    validates :description, presence: true
    validates :owner, presence: true
end
