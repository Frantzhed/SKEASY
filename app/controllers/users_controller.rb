class UsersController < ApplicationController

  def index
    @users = User.instructor
    if params.dig(:user, :ski_resort).present?
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
  end

  def show
    set_user
    @reviews = @user.reviews
    @booking = Booking.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


end
