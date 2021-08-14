class Tag < ApplicationRecord

  validates :name, presence: true, length: { maximum: 30 }

  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings, source: :article

end
