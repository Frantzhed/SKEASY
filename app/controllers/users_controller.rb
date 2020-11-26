class UsersController < ApplicationController

def index
  if params[:query].present?
    @users = User.where(instructor: true)
    @users = User.where("ski_resort ILIKE ?", "%#{params[:query]}%")
  else
    @users = User.all
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
