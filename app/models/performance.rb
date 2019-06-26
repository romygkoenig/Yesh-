class Performance < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :photo, :name, :description, :price, :city, presence: true
  validates :category, presence: true, inclusion: { in: ["Singing", "Dancing", "Other"] }
  validates :price, numericality: true

  mount_uploader :photo, PhotoUploader


  include PgSearch
  pg_search_scope :search_by_city,
                  against: :city,
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_by_city_price,
                  against: [:city, :price],
                  using: {
                    tsearch: { prefix: true }
                  }
end
