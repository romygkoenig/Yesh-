class Performance < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :photo, :name, :description, :price, :city, presence: true
  validates :category, presence: true, inclusion: { in: ["Singing", "Dancing", "Others"] }
  validates :price, numericality: true

  mount_uploader :photo, PhotoUploader
end
