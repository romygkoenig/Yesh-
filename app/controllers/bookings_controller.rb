class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit, :destroy]
  before_action :set_performance, only: [:new, :create]

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.performance = @performance
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking.update(booking_params)
    authorize @booking
    redirect_to booking_path(@booking)
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to account_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_performance
    @performance = Performance.find(params[:performance_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :performance_id, :user_id)
  end
end
