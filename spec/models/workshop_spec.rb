require 'rails_helper'

RSpec.describe Workshop, type: :model do

  let(:valid_attributes) {
    {
      location: @location,
      subject: 'New Class',
      time: Time.now,
      limit: 30,
      price: 4500
    }
  }

  let(:invalid_attributes) {
    {
      subject: 'not enough attributes'
    }
  }

  describe 'new workshop' do
    context 'with valid attributes' do
      before do
        @location = FactoryGirl.build(:location)
      end

      it 'creates a valid workshop' do
        expect(Workshop.new(valid_attributes)).to be_valid
      end

      it 'saves a new workshop' do
        @workshop = Workshop.new(valid_attributes)
        expect { @workshop.save }.to change(Workshop, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'creates an invalid workshop' do
        expect(Workshop.new(invalid_attributes)).to be_invalid
      end

      it 'does not save a new workshop' do
        @workshop = Workshop.new(invalid_attributes)
        expect { @workshop.save }.not_to change(Workshop, :count)
      end
    end
  end
end
