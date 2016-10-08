require 'rails_helper'

RSpec.describe Registration, type: :model do
  let(:valid_attributes) {
    {
      user: @user,
      workshop: @workshop
    }
  }

  let(:invalid_attributes) {
    {
      user: nil,
      workshop: nil
    }
  }

  describe 'new registration' do
    context 'with valid attributes' do
      before do


        @user = FactoryGirl.create(:user)
        @location = FactoryGirl.create(:location)
        @workshop = FactoryGirl.create(:workshop, location: @location)
      end

      it 'creates a new registration' do
        expect(Registration.new(valid_attributes)).to be_valid
      end

      it 'saves a new registration' do
        @registration = Registration.new(valid_attributes)
        expect { @registration.save }.to change(Registration, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'creates an invalid registration' do
        expect(Registration.new(invalid_attributes)).to be_invalid
      end

      it 'does not save new registration' do
        @registration = Registration.new(invalid_attributes)
        expect { @registration.save }.not_to change(Registration, :count)
      end
    end
  end
end
