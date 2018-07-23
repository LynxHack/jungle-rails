require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a producte if all proper validation' do
      @category = Category.new(name:"Testing")
      @product = Product.new(name: "TestName", price_cents: 1000, quantity:10, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end

    it 'should not create a product if name is missing' do
      @category = Category.new(name:"Testing")
      @product = Product.new(price_cents: 1000, quantity:10, :category => @category)
      @product.valid?
      puts 
      expect(@product.errors.messages[:name]).to include("can\'t be blank")
    end

    it 'should not create a product if price is missing' do
      @category = Category.new(name:"Testing")
      @product = Product.new(name: "TestName", quantity:10, :category => @category)
      @product.valid?
      expect(@product.errors.messages[:price]).to include("can\'t be blank")
    end

    it 'should not create a product if qty is missing' do
      @category = Category.new(name:"Testing")
      @product = Product.new(price_cents: 1000, name: "TestName", :category => @category)
      @product.valid?
      expect(@product.errors.messages[:quantity]).to include("can\'t be blank")
    end

    it 'should not create a product if category is missing' do
      @category = Category.new(name:"Testing")
      @product = Product.new(price_cents: 1000, quantity:10, name: "TestName")
      @product.valid?
      expect(@product.errors.messages[:category]).to include("can\'t be blank")
    end
  end

end
