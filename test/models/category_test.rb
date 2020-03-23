require 'test_helper'

class CategoeyTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name:'sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'name should be uniqe' do
    @category.save
    category2 = Category.new name: 'sports'
    assert_not category2.valid?
  end
  
  test 'name should be too long' do
    @category.name = 'a' * 100
    assert_not @category.valid?
  end

  test 'name should be too short' do
    @category.name = 'a' * 2
    assert_not @category.valid?
  end
end
