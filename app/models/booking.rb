class Booking < ApplicationRecord
  belongs_to :performance
  belongs_to :user

  validates :date, :time, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
