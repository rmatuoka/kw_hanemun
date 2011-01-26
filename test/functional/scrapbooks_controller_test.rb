require 'test_helper'

class ScrapbooksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Scrapbook.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Scrapbook.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Scrapbook.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to scrapbook_url(assigns(:scrapbook))
  end
  
  def test_edit
    get :edit, :id => Scrapbook.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Scrapbook.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Scrapbook.first
    assert_template 'edit'
  end

  def test_update_valid
    Scrapbook.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Scrapbook.first
    assert_redirected_to scrapbook_url(assigns(:scrapbook))
  end
  
  def test_destroy
    scrapbook = Scrapbook.first
    delete :destroy, :id => scrapbook
    assert_redirected_to scrapbooks_url
    assert !Scrapbook.exists?(scrapbook.id)
  end
end
