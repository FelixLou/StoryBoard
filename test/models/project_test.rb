require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
 def setup
    @project=Project.new(title: "Example Project", description: "example Project")
  end
  
  test "should be valid" do
    assert @project.valid?
  end
  
  test "title should be present" do
    @project.title="  "
    assert_not @project.valid?
  end
end
