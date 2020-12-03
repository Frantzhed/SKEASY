class BookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])

  end


  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.price = 90
    @booking.instructor = @user

    if @booking.save!
    @user_booking = UserBooking.create(
      user: current_user,
        booking: @booking,
        participants_number: booking_params[:participants_number]
      )
      redirect_to dashboard_path
    else
      render "users/show"
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

  def update_status
    Booking.find(params[:id]).update(status: params[:status])
  end


  private

  def booking_params
    params.require(:booking).permit(:end_date, :category, :participants_number, :group_session, :start_time, :end_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

