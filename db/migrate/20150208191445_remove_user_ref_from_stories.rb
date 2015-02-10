class RemoveUserRefFromStories < ActiveRecord::Migration
  def change
    remove_reference :stories, :user, index: true
    remove_foreign_key :stories, :users
  end
end
