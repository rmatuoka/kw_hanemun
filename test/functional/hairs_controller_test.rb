require 'test_helper'

class HairsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Hair.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Hair.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Hair.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hair_url(assigns(:hair))
  end
  
  def test_edit
    get :edit, :id => Hair.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Hair.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Hair.first
    assert_template 'edit'
  end

  def test_update_valid
    Hair.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Hair.first
    assert_redirected_to hair_url(assigns(:hair))
  end
  
  def test_destroy
    hair = Hair.first
    delete :destroy, :id => hair
    assert_redirected_to hairs_url
    assert !Hair.exists?(hair.id)
  end
end
