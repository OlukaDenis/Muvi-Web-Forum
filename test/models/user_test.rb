require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "John Doe", email: "johndoe@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should return name" do
    name = @user.name
    assert_equal name, "John Doe"
  end

  test "name should not be blank" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "d" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "d" * 244 + "@example.com"
    assert_not @user.valid?
  end

end
