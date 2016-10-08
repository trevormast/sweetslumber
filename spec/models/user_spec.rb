require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    {
      email: 'new@user.com',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  let(:invalid_attributes) {
    {
      email: 'new@user.com',
    }
  }

  describe 'new user' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect(User.new(valid_attributes)).to be_valid
      end

      it 'saves a new user' do
        @user = User.new(valid_attributes)
        expect { @user.save }.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'creates an invalid user' do
        expect(User.new(invalid_attributes)).to be_invalid
      end

      it 'does not save user' do
        @user = User.new(invalid_attributes)
        expect { @user.save }.not_to change(User, :count)
      end
    end
  end
end
