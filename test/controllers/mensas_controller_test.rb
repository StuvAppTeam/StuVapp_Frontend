require 'test_helper'

class MensasControllerTest < ActionController::TestCase
  setup do
    @mensa = mensas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mensas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mensa" do
    assert_difference('Mensa.count') do
      post :create, mensa: { category: @mensa.category, price: @mensa.price, timestamp: @mensa.timestamp, title: @mensa.title }
    end

    assert_redirected_to mensa_path(assigns(:mensa))
  end

  test "should show mensa" do
    get :show, id: @mensa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mensa
    assert_response :success
  end

  test "should update mensa" do
    patch :update, id: @mensa, mensa: { category: @mensa.category, price: @mensa.price, timestamp: @mensa.timestamp, title: @mensa.title }
    assert_redirected_to mensa_path(assigns(:mensa))
  end

  test "should destroy mensa" do
    assert_difference('Mensa.count', -1) do
      delete :destroy, id: @mensa
    end

    assert_redirected_to mensas_path
  end
end
