class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.instructor
  end

  def dashboard
    @bookings = current_user.client_bookings.upcoming

    if params[:past] == "true"
      @bookings = current_user.client_bookings.past
    end

    @review = Review.new

  end
end
