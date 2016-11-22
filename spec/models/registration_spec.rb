require 'rails_helper'
require 'stripe_mock'

RSpec.describe Registration, type: :model do

  let(:stripe_helper) {
    StripeMock.create_test_helper
  }

  let(:user) {
    FactoryGirl.create(:user)
  }

  let(:location) {
    FactoryGirl.create(:location)
  }

  let(:workshop) {
    FactoryGirl.create(:workshop, location: location)
  }

  let(:card_token) {
    stripe_helper.generate_card_token
  }

  let(:valid_attributes) {
    {
      user: user,
      workshop: workshop
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
        StripeMock.start
      end
      after do
        StripeMock.stop
      end

      it 'creates a new registration' do
        expect(Registration.new(valid_attributes)).to be_valid
      end

      it 'saves a new registration' do
        @registration = Registration.new(valid_attributes)
        expect { @registration.save_with_payment(card_token) }.to change(Registration, :count).by(1)
      end
    end

    context 'with no user or workshop' do
      it 'creates an invalid registration' do
        expect(Registration.new(invalid_attributes)).to be_invalid
      end

      it 'does not save new registration' do
        @registration = Registration.new(invalid_attributes)
        expect { @registration.save_with_payment(card_token) }.not_to change(Registration, :count)
      end
    end

    context 'with no card token' do
      it 'creates a valid registration' do
        expect(Registration.new(valid_attributes)).to be_valid
      end

      it 'does not save new registration' do
        @registration = Registration.new(valid_attributes)
        expect { @registration.save_with_payment(nil) }.not_to change(Registration, :count)
      end
    end
  end
end
