class UsersController < ApplicationController

  def index
    @users = User.instructor
    # raise
    if query.present?
      @users = @users.where("ski_resort ILIKE ?", "%#{params[:user][:ski_resort]}%")
    end
    if params.dig(:user, :category).present?
      @users = @users.joins(:categories).where(categories: {name: params[:user][:category]})
    end
    if params[:user][:technical_skill].present?
      @users = @users.where(technical_skill: params[:user][:technical_skill])
    end
    if params[:user][:languages].present?
      @users = @users.where("? = ANY(languages)", "#{params[:user][:languages]}")
    end
      @bookings = Booking.upcoming.available
  end

  def show
    set_user
    @query_name = @user.first_name + " " + @user.last_name
    @reviews = @user.reviews
    @booking = Booking.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def query
    @query ||= params.dig(:user, :ski_resort)&.capitalize || "SKEASY"
  end

  def query_name
    @query_name ||= params.dig(:user, :first_name, :last_name)&.capitalize || "SKEASY"
  end

end
