class User < ApplicationRecord
  validates :name, presence: true
  validates :uid, presence: true
  validates :provider, presence: true
  validates :uid, uniqueness: {scope: :provider}

  has_many :posts
end
