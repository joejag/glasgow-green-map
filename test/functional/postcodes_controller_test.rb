require File.dirname(__FILE__) + '/../test_helper'
require 'postcodes_controller'

# Re-raise errors caught by the controller.
class PostcodesController; def rescue_action(e) raise e end; end

class PostcodesControllerTest < Test::Unit::TestCase
  fixtures :postcodes

  def setup
    @controller = PostcodesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = postcodes(:first).id
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

    assert_not_nil assigns(:postcodes)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:postcode)
    assert assigns(:postcode).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:postcode)
  end

  def test_create
    num_postcodes = Postcode.count

    post :create, :postcode => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_postcodes + 1, Postcode.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:postcode)
    assert assigns(:postcode).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Postcode.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Postcode.find(@first_id)
    }
  end
end
