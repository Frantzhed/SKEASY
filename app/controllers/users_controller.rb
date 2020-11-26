class UsersController < ApplicationController

  def index
    @users = User.instructor
    if params[:user][:resort].present?
      @users = @users.where("ski_resort ILIKE ?", "%#{params[:user][:resort]}%")
    end
    if params[:user][:category].present?
      @users = @users.joins(:categories).where(categories: {name: params[:user][:category]})
    end
  end


def show
 @user = User.new
 set_user
 @reviews = []
    Review.all.each do |review|
      @reviews << review if review.booking.user_id == @user
end
end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
