require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:denis)
    # This code is not idiomatically correct.
    @question = @user.questions.build(title: "Lorem ipsum", body: "This is a test question")

  end

  test "should be valid" do
    assert @question.valid?
  end

  test "User ID must be present" do
    @question.user_id = nil
    assert_not @question.valid?
  end

  test "User ID must be an integer" do
    @question.user_id = "id"
    assert_not @question.valid?
  end

  test "Question title and body must be present" do
    @question.title = ""
    @question.body = ""
    assert_not @question.valid?
  end

  test "Question title should not be below 6 characters" do
    @question.title = "a" * 4
    assert_not @question.valid? 
  end

  test "Question body should not be beyond 255 charaters" do
    @question.body = "a" * 266
    assert_not @question.valid?
  end

  test "order should be most recent first" do
    assert_equal questions(:most_recent), Question.first
  end
end
