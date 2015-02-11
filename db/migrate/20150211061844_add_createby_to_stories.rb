class AddCreatebyToStories < ActiveRecord::Migration
  def change
    add_column :stories, :createdby, :Integer
  end
end
