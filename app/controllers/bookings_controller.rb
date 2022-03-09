class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @beach = Beach.find(params[:beach_id])
    @booking = Booking.new
  end

  def create
    @beach = Beach.find(params[:beach_id])
    @booking = Booking.new(booking_params)

    @booking.user = current_user
    @booking.beach = @beach
    if @booking.save
      redirect_to bookings_path, notice: 'Your reservation has been successfully created.'
    else
      redirect_to beach_path(@beach)
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Your reservation has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Your reservation was successfully destroyed.'
  end


private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end

end
