class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.float :point
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :stories, :projects
  end
end
