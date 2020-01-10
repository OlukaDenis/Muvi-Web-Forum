require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Muvi: The Movie Guide"
  end

  test "should get the root url" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
