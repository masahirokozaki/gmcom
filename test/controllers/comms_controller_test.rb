require 'test_helper'

class CommsControllerTest < ActionController::TestCase
  setup do
    @comm = comms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comm" do
    assert_difference('Comm.count') do
      post :create, comm: { content: @comm.content, image: @comm.image, name: @comm.name }
    end

    assert_redirected_to comm_path(assigns(:comm))
  end

  test "should show comm" do
    get :show, id: @comm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comm
    assert_response :success
  end

  test "should update comm" do
    patch :update, id: @comm, comm: { content: @comm.content, image: @comm.image, name: @comm.name }
    assert_redirected_to comm_path(assigns(:comm))
  end

  test "should destroy comm" do
    assert_difference('Comm.count', -1) do
      delete :destroy, id: @comm
    end

    assert_redirected_to comms_path
  end
end
