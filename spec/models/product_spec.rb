require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before (:each) do
      @category = Category.new(name: 'test');
      @product = Product.new(name: 'basketball', price_cents: 1, quantity: 1, category: @category)
    end

    it 'should save successfully given name, price, quantity, and category are given' do
      expect(@product).to be_valid
    end

    it 'should not save successfully given name is nil' do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it 'should not save successfully given price is nil' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it 'should not save successfully given quantity is nil' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it 'should not save successfully given category is nil' do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end
