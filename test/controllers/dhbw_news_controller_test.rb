require 'test_helper'

class DhbwNewsControllerTest < ActionController::TestCase
  setup do
    @dhbw_news = dhbw_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dhbw_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dhbw_news" do
    assert_difference('DhbwNews.count') do
      post :create, dhbw_news: { feedDate: @dhbw_news.feedDate, feedId: @dhbw_news.feedId, link: @dhbw_news.link, message: @dhbw_news.message, picture: @dhbw_news.picture }
    end

    assert_redirected_to dhbw_news_path(assigns(:dhbw_news))
  end

  test "should show dhbw_news" do
    get :show, id: @dhbw_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dhbw_news
    assert_response :success
  end

  test "should update dhbw_news" do
    patch :update, id: @dhbw_news, dhbw_news: { feedDate: @dhbw_news.feedDate, feedId: @dhbw_news.feedId, link: @dhbw_news.link, message: @dhbw_news.message, picture: @dhbw_news.picture }
    assert_redirected_to dhbw_news_path(assigns(:dhbw_news))
  end

  test "should destroy dhbw_news" do
    assert_difference('DhbwNews.count', -1) do
      delete :destroy, id: @dhbw_news
    end

    assert_redirected_to dhbw_news_index_path
  end
end
