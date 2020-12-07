class UserBookingsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @user_booking = UserBooking.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @user_booking = UserBooking.new(user_booking_params)
    @user_booking.user = current_user
    @user_booking.booking = @booking
      if @user_booking.save
        redirect_to dashboard_path
      else
      render :new
    end
  end

 

end


private

def user_booking_params
  params.require(:user_booking).permit(:participants_number)
end
