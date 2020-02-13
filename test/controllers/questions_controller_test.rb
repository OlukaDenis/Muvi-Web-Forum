require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  test "should display a new question" do
    # get questions_new_url
    # assert_response :success
    # assert_select "title", "New Question | Muvi: The Movie Guide"
  end

  def setup
    @question = questions(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Question.count' do
      post questions_path, params: { question: { title: "Tesiting the title", body: "This is the title body" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Question.count' do
      delete question_path(@question)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong question" do
    log_in_as(users(:denis))
    question = questions(:cat_video)
    assert_no_difference 'Question.count' do
      delete question_path(question)
    end
    assert_redirected_to root_url
  end

end
