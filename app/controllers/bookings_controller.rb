class BookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])

  end


  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end
  
  def create
    @instructor = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.instructor = @instructor
    if @booking.save
      @user_booking = UserBooking.new(user: current_user, booking: @booking)
      @user_booking.save
      redirect_to user_path(@instructor)
    else
      render :new
    end
  end

  def edit
    set_booking
  end

  def update
    set_booking
    @booking.update(booking_params)
    redirect_to bookings_path()
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@booking.user)
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :category)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

