require File.dirname(__FILE__) + '/../test_helper'
require 'places_controller'

# Re-raise errors caught by the controller.
class PlacesController; def rescue_action(e) raise e end; end

class PlacesControllerTest < Test::Unit::TestCase
  fixtures :places

  def setup
    @controller = PlacesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = places(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:places)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:place)
    assert assigns(:place).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:place)
  end

  def test_create
    num_places = Place.count

    post :create, :place => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_places + 1, Place.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:place)
    assert assigns(:place).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Place.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Place.find(@first_id)
    }
  end
end
