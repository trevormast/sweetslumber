require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:valid_attributes) {
    {
      name: 'New Location',
      address: "New Address"
    }
  }

  let(:invalid_attributes) {
    {
      name: 'not enough attributes'
    }
  }

  describe 'new location' do
    context 'with valid attributes' do
      it 'creates a new location' do
        expect(Location.new(valid_attributes)).to be_valid
      end

      it 'saves a new location' do
        @location = Location.new(valid_attributes)
        expect { @location.save }.to change(Location, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'creates an invalid location' do
        expect(Location.new(invalid_attributes)).to be_invalid
      end

      it 'does not save a new location' do
        @location = Location.new(invalid_attributes)
        expect { @location.save }.not_to change(Location, :count)
      end
    end
  end
end
