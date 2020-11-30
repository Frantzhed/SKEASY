class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    @review.save
    redirect_to user_path(@booking.instructor)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@user)
  end

  private

  def review_params
    params.require(:review).permit(:rate, :content)
  end
end
