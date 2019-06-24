class Account::BookingsController < ApplicationController

  def index
    # @bookings =current_user.bookings
    @bookings = policy_scope(Booking)
  end
end
