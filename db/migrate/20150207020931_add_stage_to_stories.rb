class AddStageToStories < ActiveRecord::Migration
  def change
    add_column :stories, :stage, :string
  end
end
