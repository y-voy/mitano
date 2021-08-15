class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Following', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Following', dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :image, ImageUploader

  def follow!(user_id)
    active_relationships.create!(followed_id: user_id)
  end

  def following?(user_id)
    active_relationships.find_by(followed_id: user_id)
  end

  def unfollow!(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end

  def self.guest
  find_or_create_by!(email: 'aaa@aaa.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.password_confirmation = user.password
    user.name = 'aaa'
    end
  end

  def self.admin_guest
  find_or_create_by!(email: 'aaa@admin.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.password_confirmation = user.password
    user.name = 'guest_admin'
    user.admin = true
    end
  end

end
