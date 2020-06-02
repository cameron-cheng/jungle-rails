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
    end
    describe "password is created" do
      context "given a password" do
        it "returns true" do
          user = User.new({email: 'abcd@abc.com', password: '123', password_confirmation: '123'})
            expect(user.save).to eql(true)
        end
      end
    end
    describe "password is created" do
      context "match password confirmation" do
        it "returns true" do
          user = User.new({email: 'abcd@abc.com', password: '123', password_confirmation: '123'})
            expect(user.save).to eql(true)
        end
      end
      describe "password is created" do
        context "does not match password confirmation" do
          it "returns false" do
            user = User.new({email: 'abcd@abc.com', password: '1234', password_confirmation: '123'})
              expect(user.save).to eql(false)
          end
        end
    end
  end
end
