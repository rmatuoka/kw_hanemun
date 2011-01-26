require 'test_helper'

class InfosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Info.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Info.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Info.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to info_url(assigns(:info))
  end
  
  def test_edit
    get :edit, :id => Info.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Info.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Info.first
    assert_template 'edit'
  end

  def test_update_valid
    Info.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Info.first
    assert_redirected_to info_url(assigns(:info))
  end
  
  def test_destroy
    info = Info.first
    delete :destroy, :id => info
    assert_redirected_to infos_url
    assert !Info.exists?(info.id)
  end
end
