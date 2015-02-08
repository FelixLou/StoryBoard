class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit,:update,:show,:destory]
  before_action :correct_user, only: [:edit,:update]
  
  def index
    @users=User.all
  end
  
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)
    @user.admin=true  if params[:admin]=="true"
    if @user.save
      flash[:success]="Successful created!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @user=User.find(params[:id])
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Profile updated!"      
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to users_url
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
  
  def logged_in_user
    unless logged_in?
      flash[:danger]="Pleasee log in."
      redirect_to login_path
    end
  end
  
  def correct_user
    @user=User.find(params[:id])
    redirect_to(current_user) unless current_user?(@user)
  end
end
