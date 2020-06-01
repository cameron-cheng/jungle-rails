require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe "name is present for saving" do
      context "given a name" do
        it "returns true" do
          product = Product.new({name: 'Switch', price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(true)
        end
      end
      context "not given a name" do
        it "returns false" do
          product = Product.new({price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(false)
        end
      end
    end
    describe "price is present for saving" do
      context "given a price" do
        it "returns true" do
          product = Product.new({name: 'Switch', price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(true)
        end
      end
      context "not given a price" do
        it "returns false" do
          product = Product.new({name: 'Switch', quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(false)
        end
      end
      context "given a number for the price" do
        it "returns true" do
          product = Product.new({name: 'Switch', price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(true)
        end
      end
      context "given a string for the price" do
        it "returns false" do
          product = Product.new({name: 'Switch', price: 'FREE', quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(false)
        end
      end
    end
    describe "quantity is given for saving" do
      context "given a quantity" do
        it "returns true" do
          product = Product.new({name: 'Switch', price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(true)
        end
      end
      context "not given a quantity" do
        it "returns false" do
          product = Product.new({name: 'Switch', price: 100, quantity: nil, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(false)
        end
      end
    end
    describe "save quantity" do
      context "string not given as a quantity" do
        it "returns true" do
          product = Product.new({name: 'Switch', price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(true)
        end
      end
      context "string given as a quantity" do
        it "returns false" do
          product = Product.new({name: 'Switch', price: 100, quantity: 'FREE', category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(false)
        end
      end
    end
    describe "category is present for saving" do
      context "given a category" do
        it "returns true" do
          product = Product.new({name: 'Switch', price: 100, quantity: 10, category: Category.new({name: 'Video Games'})})
          expect(product.save).to eql(true)
        end
      end
      context "not given a category" do
        it "returns false" do
          product = Product.new({price: 100, quantity: 10, category: Category.new({name: nil})})
          expect(product.save).to eql(false)
        end
      end
    end
  end
end
