class Account::BookingsController < ApplicationController
  def index
    # @bookings =current_user.bookings
    @bookings = policy_scope(current_user.bookings).where.not(latitude: nil, longitude: nil)

    @markers = @bookings.map do |booking|
    {
      lat: booking.latitude,
      lng: booking.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { booking: booking }),
      image_url: helpers.asset_url('logo.png')
    }
    end
  end
end
