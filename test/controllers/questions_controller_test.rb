require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  test "should display a new question" do
    get '/questions/new'
    assert_response :success
    assert_select "title", "New Question | Muvi: The Movie Guide"
  end
end
