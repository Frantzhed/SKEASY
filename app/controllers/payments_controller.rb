class PaymentsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
  end

   def create
   end
end
