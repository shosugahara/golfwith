class Lesson < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :headcount, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :notifications, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  scope :search_by_keyword, -> (keyword) {
    where("description LIKE ? or title LIKE ?","%"+ keyword+"%","%"+keyword+"%" ) if keyword.present?
  }



  mount_uploader :image, ImageUploader
end
