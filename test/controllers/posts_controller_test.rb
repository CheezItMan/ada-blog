require "test_helper"

describe PostsController do

  let(:postone) {posts(:one)}
  let(:userone) {users(:one)}

  describe "Reading information" do
    it "should get index" do
      get posts_path(userone.id)
      must_respond_with :success
    end

    it "should redirect if the user id is not valid" do
      get posts_path('baloney')
      must_respond_with 404
      flash[:error] = "That blog doesn't exist"
    end
    #
    it "should get show" do
      get post_path(userone.id,  postone.id )
      must_respond_with :success
    end
    it "should redirect if the user id is not valid" do
      get post_path('baloney', 3)
      must_respond_with 404
      flash[:error] = "That blog doesn't exist"
    end

  end


  #
  # it "should get new" do
  #   get blogs_new_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get create" do
  #   get blogs_create_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get edit" do
  #   get blogs_edit_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get update" do
  #   get blogs_update_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get destroy" do
  #   get blogs_destroy_url
  #   value(response).must_be :success?
  # end

end
