class UsersController < ApplicationController
  before_action :require_user_logged_in,only:[:index,:show]
  before_action :correct_user, only:[:index,:show]
  
  def index
    @users= User.find(params[:id]).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success]= "ユーザー登録しました"
      redirect_to @user
    else
      flash[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
