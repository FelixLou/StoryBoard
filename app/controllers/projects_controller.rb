class ProjectsController < ApplicationController
  before_action :logged_in_user, only: [:create,:new, :index,:edit,:update,:show,:destroy]
  #before_action :correct_user, only: [:edit,:update]
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

  def add_developer
    @project = Project.find(params[:id])
    @user1 = User.find_by(user_params)

    if @user1!=nil && @user1.project_id == nil && !@user1.admin?
          @user1.project_id = @project.id
          @user1.save
          redirect_to @project
    elsif @user1==nil
      flash.now[:danger]='this user does not exists!'
    elsif @user1.project_id !=nil
      if @user1.project_id == @project.id
        flash.now[:danger]='this user already belongs to this project!'
      else
        flash.now[:danger]='this user already belongs to other project!'
      end
    elsif @user1.admin?
      flash.now[:danger]='you cannot add an admin to a project!'
    end
  end


  def show
    @user = User.new()
    @project = Project.find(params[:id])
    @point1 = @point2= @point3 = @point4 = @point5 =  0
    @project.stories.each do |s|
      if s.stage == 'Analysis'
        @point1 += s.point.to_f
      end
      if s.stage == 'Read For Dev'
        @point2 += s.point.to_f
      end
      if s.stage == 'In Dev'
        @point3 += s.point.to_f
      end
      if s.stage == 'Dev Complete'
        @point4 += s.point.to_f
      end
      if s.stage == 'In Test'
        @point5 += s.point.to_f
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end


  def index
    @projects = Project.all
  end

  def destroy
    @project = Project.find(params[:id])
    @project.users.each do |u_p|
      u_p.project_id = u_p.story_id=  nil
      u_p.save
    end
    @project.stories.each do|s|
      s.destroy
    end
    @project.destroy
    redirect_to projects_path
  end
  private
  def project_params
     params.require(:project).permit(:title,:description)
  end
  def user_params
    params.require(:user).permit(:email)
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
