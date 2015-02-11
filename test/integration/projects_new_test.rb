require 'test_helper'

class ProjectsNewTest < ActionDispatch::IntegrationTest
  test "valid new project" do
    get new_project_path
    assert_difference 'Project.count',1 do
      post_via_redirect projects_path, project: { title: "Example Project",
      description: "Example Project Description"}
    end
    assert_template "projects/show"
  end
end
