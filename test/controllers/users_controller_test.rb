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
    flash[:errors].must_equal "That user does not exist"
  end

  describe "login/testing authentication" do
    it "should login an existing user" do
      login(users(:one))
      session[:uid].must_equal users(:one).uid
      session[:provider].must_equal users(:one).provider
      must_redirect_to root_path
    end

    it "should create a new account and log in a nonexisting user" do
      start_count = User.count
      new_user = User.new name: "Sam", uid: 555, provider: "github"
      login(new_user)
      flash[:success].must_equal "Welcome #{new_user.name}"
      must_redirect_to root_path
      end_count = User.count
      end_count.must_equal start_count + 1

    end

    it "should create a new account and log in a nonexisting user" do
      new_user = User.new name: "Sam", uid: 555, provider: "github"
      proc {
        login(new_user)
      }.must_change 'User.count', 1
      flash[:success].must_equal "Welcome #{new_user.name}"
      must_redirect_to root_path
    end

    it "for users who directly link to login page and not logged in, redirect_to home with flash message" do
      invalid_user = User.new
      proc {
        login(invalid_user)
      }.must_change 'User.count', 0
      flash[:error].must_equal "Could not log in user"
      must_redirect_to root_path
    end


  end

  it "logouts out a user" do
    login(users(:one))
    delete logout_path
    must_redirect_to root_path
    session[:uid].must_equal nil
    session[:provider].must_equal nil
  end

  #EDGE CASE
  it "can't logout a user that's already logged out / does something specific if that happens" do
    login(users(:one))
    delete logout_path
    delete logout_path
    flash[:error].must_equal "You are already logged out"

  end

end
