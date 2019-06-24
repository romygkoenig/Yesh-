class Performance < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
