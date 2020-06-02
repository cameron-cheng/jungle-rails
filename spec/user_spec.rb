require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Password' do
    describe "password is created" do
      context "not given a password" do
        it "returns false" do
          user = User.new({email: 'abc@abc.com'})
            expect(user.save).to eql(false)
        end
      end
      context "given a password" do
        it "returns true" do
          user = User.new({email: 'sdfsd@abc.com', password: '123', password_confirmation: '123', name: 'abc'})
            expect(user.save).to eql(true)
        end
      end
      context "match password confirmation" do
        it "returns true" do
          user = User.new({email: 'sdfdsfsd@abc.com', password: '123', password_confirmation: '123', name: 'abc'})
            expect(user.save).to eql(true)
        end
      end
      context "does not match password confirmation" do
        it "returns false" do
          user = User.new({email: 'abcd@abc.com', password: '1234', password_confirmation: '123', name: 'abc'})
            expect(user.save).to eql(false)
        end
      end
    end    
  end


  describe 'Email' do
    describe "email is not created" do
      context "email is duplicated" do
        it "returns false" do
          first_user = User.new({email: 'abcde@abc.com', password: '123', password_confirmation: '123', name: 'abc'})
          first_user.save
          second_user = User.new({email: 'ABCDE@abc.com', password: '123', password_confirmation: '123', name: 'abc'})
          expect(second_user.save).to eql(false)
        end
      end
    end
    describe "email is created" do
      context "email is not duplicated" do
        it "returns true" do
          user = User.new({email: 'dsfsdsf@cba.com', password: '123', password_confirmation: '123', name: 'abc'})
          expect(user.save).to eql(true)
        end
      end
    end
  end
  describe "name" do
    describe "name is required" do
    context "name is submitted" do
      it "returns true" do
        user = User.new({email: 'dsfsdsf@cba.com', password: '123', password_confirmation: '123', name: 'abc'})
        expect(user.save).to eql(true)
        end
      end
    end
      context "name is not submitted" do
        it "returns false" do
          user = User.new({email: 'dsfsdsf@cba.com', password: '123', password_confirmation: '123'})
          expect(user.save).to eql(false)
        end
      end
  end
  describe "password length" do
    context "password is longer than 3 characters" do
      it "returns true" do
        user = User.new({email: 'dsfsdsf@cba.com', password: '1234', password_confirmation: '1234', name: 'abc'})
        expect(user.save).to eql(true)
      end
    end
  end
  context "password is not longer than 3 characters" do
    it "returns false" do
      user = User.new({email: 'dsfsdsf@cba.com', password: '12', password_confirmation: '12', name: 'abc'})
      expect(user.save).to eql(false)
    end
  end
  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new({email: 'user@example.com', password: '1234', password_confirmation: '1234', name: 'abc'})
      @user.save()
    end
    context "succesful login" do
      it "returns true" do
        result = User.authenticate_with_credentials("user@example.com", "1234")
        expect(result).to eq(@user)
      end
    end
    context "spaces removed" do
      it "returns true" do
        result = User.authenticate_with_credentials(" user@example.com ", "1234")
        expect(result).to eq(@user)
      end
    end
    context "case insensitive" do
      it "returns true" do
        result = User.authenticate_with_credentials("USER@example.com", "1234")
        expect(result).to eq(@user)
      end
    end
  end
end

