require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "John Doe", email: "johndoe@gmail.com", password: "P@ssword1", password_confirmation: "P@ssword1")
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

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com] 
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation  = ""
    assert_not @user.valid?
  end

  test "password should have a minimum of 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password should not be valid with a confirmation mismatch" do
    @user.password = "word"
    @user.password_confirmation = "different"
    assert_not @user.valid?
  end

  test "password should not exceed 20 characters" do
    @user.password = @user.password_confirmation = "a" * 30
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.questions.create!(title: "Lorem ipsum", body: "This is a test question")
    assert_difference 'Question.count', -1 do
      @user.destroy
    end
  end

end
