require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:valid_attributes) {
    {
      email: 'new@admin.com',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  let(:invalid_attributes) {
    {
      email: 'new@admin.com',
    }
  }

  describe 'new admin' do
    context 'with valid attributes' do
      it 'creates a new admin' do
        expect(Admin.new(valid_attributes)).to be_valid
      end

      it 'saves a new admin' do
        @admin = Admin.new(valid_attributes)
        expect { @admin.save }.to change(Admin, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'creates an invalid admin' do
        expect(Admin.new(invalid_attributes)).to be_invalid
      end

      it 'does not save admin' do
        @admin = Admin.new(invalid_attributes)
        expect { @admin.save }.not_to change(Admin, :count)
      end
    end
  end
end
