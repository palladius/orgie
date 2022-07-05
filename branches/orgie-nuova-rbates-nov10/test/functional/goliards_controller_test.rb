require 'test_helper'

class GoliardsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Goliards.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Goliards.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Goliards.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to goliards_url(assigns(:goliards))
  end
  
  def test_edit
    get :edit, :id => Goliards.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Goliards.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Goliards.first
    assert_template 'edit'
  end

  def test_update_valid
    Goliards.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Goliards.first
    assert_redirected_to goliards_url(assigns(:goliards))
  end
  
  def test_destroy
    goliards = Goliards.first
    delete :destroy, :id => goliards
    assert_redirected_to goliards_url
    assert !Goliards.exists?(goliards.id)
  end
end
