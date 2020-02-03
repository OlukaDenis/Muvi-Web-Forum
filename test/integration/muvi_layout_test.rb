require 'test_helper'

class MuviLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @base_title = "Muvi: The Movie Guide"
  end

  test "layout links" do
    get root_path
    assert_template root_path
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "title", full_title("")
    get help_path
    assert_select "title", full_title("Help")
    get about_path
    assert_select "title", full_title("About")
  end

  test "full title helper" do
    assert_equal full_title("Help"), "Help | #{@base_title}"
    assert_equal full_title(""), "#{@base_title}"
    assert_equal full_title("About"), "About | #{@base_title}" 
  end
end
