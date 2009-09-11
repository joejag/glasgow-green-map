require File.dirname(__FILE__) + '/../test_helper'
require 'photo_admin_controller'

# Re-raise errors caught by the controller.
class PhotoAdminController; def rescue_action(e) raise e end; end

class PhotoAdminControllerTest < Test::Unit::TestCase
  fixtures :photos

  def setup
    @controller = PhotoAdminController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = photos(:first).id
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

    assert_not_nil assigns(:photos)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:photo)
    assert assigns(:photo).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:photo)
  end

  def test_create
    num_photos = Photo.count

    post :create, :photo => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_photos + 1, Photo.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:photo)
    assert assigns(:photo).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Photo.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Photo.find(@first_id)
    }
  end
end
