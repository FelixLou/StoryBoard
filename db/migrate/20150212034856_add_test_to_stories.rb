class AddTestToStories < ActiveRecord::Migration
  def change
    add_column :stories, :test, :string
  end
end
