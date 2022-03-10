class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept, :decline]

  def index
    @bookings = Booking.all
    user = current_user
    @beaches = user.beaches
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
    @booking.status = "en attente"
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

  def accept
    @booking.status = "confirmed"
    if @booking.save
      redirect_to bookings_path, notice: 'Your reservation has been successfully confirmed.'
    else
      redirect_to bookings_path
    end

  end

  def decline
    @booking.status = "declined"
    if @booking.save
      redirect_to bookings_path, notice: 'Your reservation has been successfully declined.'
    else
      redirect_to bookings_path
    end

  end


private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end

end
