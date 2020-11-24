class UsersController < ApplicationController

def index
  @users = User.where(instructor: true)
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
