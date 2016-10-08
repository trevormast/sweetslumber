require 'rails_helper'

RSpec.describe Questionaire, type: :model do
  let(:valid_attributes) {
    {
      baby_name: 'new baby',
      baby_dob: DateTime.now,
      nap_location: 'location',
      night_location: 'location',
      desired_sleep_location: 'location',
      nap_routine: 'routine',
      night_routine: 'routine',
      naps_per_day: 5,
      bedtime: Time.now,
      sleep_obstacle: 'obstacle',
      nightwakings: 5,
      sleep_goal: 'goal',
      referred_by: 'a person'
    }
  }

  let(:invalid_attributes) {
    {
      baby_name: 'not enough attributes'
    }
  }

  describe 'new questionaire' do
    context 'with valid attributes' do
      it 'creates a new questionaire' do
        expect(Questionaire.new(valid_attributes)).to be_valid
      end

      it 'saves a new questionaire' do
        @questionaire =  Questionaire.new(valid_attributes)
        expect { @questionaire.save }.to change(Questionaire, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'creates an invalid questionaire' do
        expect(Questionaire.new(invalid_attributes)).to be_invalid
      end

      it 'does not save new questionaire' do
        @questionaire = Questionaire.new(invalid_attributes)
        expect { @questionaire.save }.not_to change(Questionaire, :count)

      end
    end
  end
end
