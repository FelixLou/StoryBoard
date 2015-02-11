class StoriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @stories = @project.stories.all
  end

  def replace_user
    @project = Project.find(params[:project_id])
<<<<<<< HEAD
    if params[:id]!=nil
      @temp_story=Story.find(params[:id])
      @selected_user = User.find(params[:id])
=======
      @temp_story=Story.find(params[:id])
    if @temp_story.users[0]!=current_user && @temp_story.users[1]!=current_user
      @selected_user = User.find(params[:user][:id])
>>>>>>> 62d99ecddcc9adcedc992ae0c6b8040a81804125
      @selected_user.story_id = nil
      @selected_user.save
      current_user.story_id = @temp_story.id
      current_user.save
<<<<<<< HEAD
    else
      redirect_to @project
    end
=======
    end
      redirect_to project_stories_path(@project)
>>>>>>> 62d99ecddcc9adcedc992ae0c6b8040a81804125
  end

  def show
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    if @story.users.count<2
      current_user.story_id = @story.id
      current_user.save
<<<<<<< HEAD
=======
      redirect_to project_stories_path(@project)
>>>>>>> 62d99ecddcc9adcedc992ae0c6b8040a81804125
    else
      render 'replace'
    end
  end

<<<<<<< HEAD
=======
  def signoff
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    current_user.story_id = nil
    current_user.save
    redirect_to project_stories_path(@project)
  end

>>>>>>> 62d99ecddcc9adcedc992ae0c6b8040a81804125
  def edit
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    @story.update(story_params)
    redirect_to project_stories_path(@project,@story)
  end

  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.create(story_params)
    redirect_to project_stories_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
    @story.users.each do|u|
      u.story_id =nil
      u.save
    end
    @story.destroy
    redirect_to project_stories_path(@project)
  end
  private
    def story_params
      params.require(:story).permit(:title, :description, :point, :stage)
    end
end
