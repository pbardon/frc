class UsersController < ApplicationController
  
  def index
    users = User.all
    render json: users
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, :status => :unprocessable_entity
    end
  end
  
 
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    render json: @user
  end
  
  def show
    @user = User.find{|u| u.id = params[:id]}
    render json: @user
  end
  
  def update
     print params
     user = User.find(params[:id])
     if user.update_attributes(user_params)
       render json: user
     else
       render json: user.errors
     end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
