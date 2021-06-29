require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before (:each) do
      @user = User.new(name: 'Moses Kim', email: 'abc@gmail.com', password: '12345678', password_confirmation: '12345678')
      @user.save
    end

    context "create new user form" do
      it "should successfully create a new user if all fields are correct" do
        expect(@user).to be_valid
      end

      it 'should not allow two users to sign up with the same email' do
        user2 = User.new(name: 'Moses Kim', email: 'abc@gmail.com', password: '12345678', password_confirmation: '12345678')
        user2.save
        expect(user2).to_not be_valid
      end

      it 'should reject if passwords do not match' do
        @user.password_confirmation = '1234'
        expect(@user).to_not be_valid
      end

      it 'should require name' do
        @user.name = nil
        expect(@user).to_not be_valid
      end

      it 'should require email' do
        @user.email = nil
        expect(@user).to_not be_valid
      end

      it 'should show error if password is under 8 characters' do
        @user.password = '1234'
        expect(@user).to_not be_valid
      end

      it 'should not matter if email is not case sensitive' do
        auth_user = User.authenticate_with_credentials('AbC@gmail.com', 12345678)
        expect(auth_user).to be_truthy
      end
    end
  end

end