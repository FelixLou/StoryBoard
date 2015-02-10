class AddUserRefToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :user, index: true
    add_foreign_key :stories, :users
  end
end
