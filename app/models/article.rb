class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :likes, source: :user
end
