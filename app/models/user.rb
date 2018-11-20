class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  validates :email, presence: true, length: { maximum: 255 },
             uniqueness: true,
             format: { with: VALID_EMAIL_REGEX }

  with_options if: :lesson_pro? do |pro|
    pro.validates :license_num, presence: true, uniqueness: true
    pro.validates :license_image, presence: true
  end
  def lesson_pro?
    level == "pro"
  end


  has_many :lessons, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :notifications, dependent: :destroy


  #validates :password, presence: true, length: { in: 8..32 } ,
  #format: { with: VALID_PASSWORD_REGEX } , allow_nil: true
  #validates :license_image, presence: true, allow_nil: true

  mount_uploader :license_image, ImageUploader
  mount_uploader :image_name, ImageUploader
end
