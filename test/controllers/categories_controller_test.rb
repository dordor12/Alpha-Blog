require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: 'sports' + rand(100).to_s)
    @controller = CategoriesController.new
  end
  test 'should get catigories index' do
    get :index
    assert_response :success
  end

  test 'should get catigories new' do
    get :new
    assert_response :success
  end

  test 'should get catigories show' do
    get :show, params: { id: @category.id }
    assert_response :success
  end
end