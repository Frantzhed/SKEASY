class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @users = User.instructor
    if query.present? && params.dig(:user)
      @users = @users.where("ski_resort ILIKE ?", "%#{params[:user][:ski_resort]}%")
      session[:ski_resort] = params[:user][:ski_resort] 
    end
    if params.dig(:user, :category).present?
      @users = @users.joins(:categories).where(categories: {name: params[:user][:category]})
      session[:category] = params[:user][:category]
    end
    if params.dig(:user, :technical_skill).present?
      @users = @users.where(technical_skill: params[:user][:technical_skill])
      session[:technical_skill] = params[:user][:technical_skill]
    end
    if params.dig(:user, :languages).present?
      @users = @users.where("? = ANY(languages)", "#{params[:user][:languages]}")
      session[:languages] = params[:user][:languages]
    end
    session[:end_date] = params[:user][:end_date] if params[:user]
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

  def ski_resort_params
    params.dig(:user, :ski_resort)
  end

  def full_name_params
    params.dig(:user, :first_name, :last_name)
  end

  def query
    @query ||= ski_resort_params.present? ? ski_resort_params.capitalize : "SKEASY"
  end

  def query_name
    @query_name ||= full_name_params.present? ? full_name_params.capitalize : "SKEASY"
  end

end
