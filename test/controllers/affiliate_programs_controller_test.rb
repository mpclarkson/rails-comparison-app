require 'test_helper'

class AffiliateProgramsControllerTest < ActionController::TestCase
  setup do
    @affiliate_program = affiliate_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiliate_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiliate_program" do
    assert_difference('AffiliateProgram.count') do
      post :create, affiliate_program: { description: @affiliate_program.description, display_name: @affiliate_program.display_name, name: @affiliate_program.name }
    end

    assert_redirected_to affiliate_program_path(assigns(:affiliate_program))
  end

  test "should show affiliate_program" do
    get :show, id: @affiliate_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affiliate_program
    assert_response :success
  end

  test "should update affiliate_program" do
    patch :update, id: @affiliate_program, affiliate_program: { description: @affiliate_program.description, display_name: @affiliate_program.display_name, name: @affiliate_program.name }
    assert_redirected_to affiliate_program_path(assigns(:affiliate_program))
  end

  test "should destroy affiliate_program" do
    assert_difference('AffiliateProgram.count', -1) do
      delete :destroy, id: @affiliate_program
    end

    assert_redirected_to affiliate_programs_path
  end
end
