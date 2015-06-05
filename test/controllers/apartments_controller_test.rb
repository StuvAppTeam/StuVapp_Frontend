require 'test_helper'

class ApartmentsControllerTest < ActionController::TestCase
  setup do
    @apartment = apartments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartment" do
    assert_difference('Apartment.count') do
      post :create, apartment: { additionalCost: @apartment.additionalCost, city: @apartment.city, deposit: @apartment.deposit, description: @apartment.description, furnished: @apartment.furnished, internet: @apartment.internet, movein: @apartment.movein, parking: @apartment.parking, phase: @apartment.phase, rent: @apartment.rent, request: @apartment.request, rooms: @apartment.rooms, size: @apartment.size, smoking: @apartment.somking, street: @apartment.street, title: @apartment.title, totalPrize: @apartment.totalPrize, type: @apartment.type, user_id: @apartment.user_id, zipcode: @apartment.zipcode }
    end

    assert_redirected_to apartment_path(assigns(:apartment))
  end

  test "should show apartment" do
    get :show, id: @apartment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apartment
    assert_response :success
  end

  test "should update apartment" do
    patch :update, id: @apartment, apartment: { additionalCost: @apartment.additionalCost, city: @apartment.city, deposit: @apartment.deposit, description: @apartment.description, furnished: @apartment.furnished, internet: @apartment.internet, movein: @apartment.movein, parking: @apartment.parking, phase: @apartment.phase, rent: @apartment.rent, request: @apartment.request, rooms: @apartment.rooms, size: @apartment.size, smoking: @apartment.somking, street: @apartment.street, title: @apartment.title, totalPrize: @apartment.totalPrize, type: @apartment.type, user_id: @apartment.user_id, zipcode: @apartment.zipcode }
    assert_redirected_to apartment_path(assigns(:apartment))
  end

  test "should destroy apartment" do
    assert_difference('Apartment.count', -1) do
      delete :destroy, id: @apartment
    end

    assert_redirected_to apartments_path
  end
end
