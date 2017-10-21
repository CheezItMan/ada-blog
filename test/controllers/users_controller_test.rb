require "test_helper"

describe UsersController do
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should get show" do
    get user_path(users(:one).id)
    must_respond_with :success
  end

  it "should redirect to all users page if user not found" do
    users(:one).destroy
    get user_path(users(:one).id)
    must_redirect_to users_path
    flash[:errors] = "That user does not exist"
  end

  #
  # it "should get login" do
  #   get users_login_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get logout" do
  #   get users_logout_url
  #   value(response).must_be :success?
  # end

end
