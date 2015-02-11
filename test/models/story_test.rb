require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  def setup
    @story=Story.new(title: "Example Story", description: "example story")
  end
  
  test "should be valid" do
    assert @story.valid?
  end
  
  test "title should be present" do
    @story.title="  "
    assert_not @user.valid?
  end
end
