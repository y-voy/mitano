class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  is_impressionable counter_cache: true

  def like(current_user)
    self.likes.find { |like| like.user_id == current_user.id }
  end

  def like?(current_user)
    self.like(current_user).present?
  end

  def stock(current_user)
    self.stocks.find { |stock| stock.user_id == current_user.id }
  end

  def stock?(current_user)
    self.stock(current_user).present?
  end

end
