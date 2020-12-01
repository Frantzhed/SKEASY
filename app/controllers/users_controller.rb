class UsersController < ApplicationController

  def index
    @users = User.instructor
    if query.present?
      @users = @users.where("ski_resort ILIKE ?", "%#{params[:user][:ski_resort]}%")
      session[:ski_resort]=params[:user][:ski_resort]
    end
    if params.dig(:user, :category).present?
      @users = @users.joins(:categories).where(categories: {name: params[:user][:category]})
      session[:category]=params[:user][:category]
    end
    if params[:user][:technical_skill].present?
      @users = @users.where(technical_skill: params[:user][:technical_skill])
      session[:technical_skill]=params[:user][:technical_skill]
    end
    if params[:user][:languages].present?
      @users = @users.where("? = ANY(languages)", "#{params[:user][:languages]}")
      session[:languages]=params[:user][:languages]
    end
      @bookings = Booking.upcoming.available
  end

  def show
    @technical_skill = session[:technical_skill]
    @category = session[:category]
    @ski_resort = session[:ski_resort]
    @languages = session[:languages]
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
