require 'test_helper'

class StoryNewTest < ActionDispatch::IntegrationTest
  test "valid new story" do
    get new_story_path
    assert_difference 'Story.count',1 do
      post_via_redirect stories_path, story: { title: "Example Story",
      description: "Example Story Description"}
    end
    assert_template "stories/show"
  end
end
