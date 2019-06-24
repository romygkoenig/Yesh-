class Performance < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
