require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should display a new question" do
    # resources questions
    assert_response :success
    assert_select "title", "New Question | Muvi:The Movie Guide"
  end
end
