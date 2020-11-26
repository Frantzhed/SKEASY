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
end


private

def set_user
  @user = User.find(params[:id])
end
end
