class BookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])

  end

  def show
    @booking = Booking.find(params[:id])

  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.amount = 45
    @booking.instructor = @user
    @booking.user_sku = @user.first_name[0..3] + "-" + @user.last_name[0..3]
    if @booking.save
      @user_booking = UserBooking.create(
        user: current_user,

        booking: @booking,
        participants_number: booking_params[:participants_number]
      )
      redirect_to dashboard_path
    else
      render "users/show" #locals: {id: @booking.instructor}stripe?
    end
  end

  def booking_accepted
      booking = Booking.find(params[:booking_id])
    session = Stripe::Checkout::Session.create(
                 payment_method_types: ["card"],
                 line_items: [{
                   name: booking.user_sku,
                   images: [booking.instructor.photo],
                   amount: booking.amount_cents,
                   currency: "eur",
                   quantity: 1
                 }],
                 success_url: dashboard_url,
                 cancel_url: dashboard_url
               )
             booking.update(checkout_session_id: session.id,status: “Paid”)
            redirect_to dashboard_path
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
