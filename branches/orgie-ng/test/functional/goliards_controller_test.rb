require 'test_helper'

class GoliardsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Goliard.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Goliard.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Goliard.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to goliard_url(assigns(:goliard))
  end
  
  def test_edit
    get :edit, :id => Goliard.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Goliard.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Goliard.first
    assert_template 'edit'
  end

  def test_update_valid
    Goliard.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Goliard.first
    assert_redirected_to goliard_url(assigns(:goliard))
  end
  
  def test_destroy
    goliard = Goliard.first
    delete :destroy, :id => goliard
    assert_redirected_to goliards_url
    assert !Goliard.exists?(goliard.id)
  end
end
