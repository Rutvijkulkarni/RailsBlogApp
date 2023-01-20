require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:user1)
    post user_session_url
    @like = likes(:one)
  end

  test "should get index" do
    get likes_url
    assert_response :success
  end

  test "should get new" do
    get new_like_url
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      post likes_url, params: { like: { article_id: @like.article_id, user_id: @like.user_id } }
    end

    assert_redirected_to article_url(Like.last.article)
  end

  test "should show like" do
    get like_url(@like)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_url(@like)
    assert_response :success
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete like_url(@like)
    end

    assert_redirected_to article_url(@like.article)
  end
end
