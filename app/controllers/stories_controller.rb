class StoriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @stories = @project.stories.all
  end
  def show
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    if @story.users.count<2
      current_user.story_id = @story.id
      current_user.save
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.create(story_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
    @story.destroy
    redirect_to project_path(@project)
  end
  private
    def story_params
      params.require(:story).permit(:title, :description, :point, :stage)
    end
end
