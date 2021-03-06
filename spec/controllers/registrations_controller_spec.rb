require 'rails_helper'
require 'stripe_mock'

RSpec.describe RegistrationsController, type: :controller do
  let(:stripe_helper) { StripeMock.create_test_helper }

  let(:valid_params)  {
    { baby_name: 'baby',
      baby_dob: @workshop.time.months_ago(6),
      nap_location: 'crib',
      night_location: 'crib',
      desired_sleep_location: 'crib',
      nap_routine: 'none',
      night_routine: 'none',
      naps_per_day: 2,
      bedtime: '12:00 PM'.to_time,
      sleep_obstacle: 'none',
      nightwakings: 2,
      sleep_goal: 'none',
      referred_by: 'no one'
    }
  }

  let(:comparable_params) {
    valid_params.except(:baby_dob, :bedtime)
  }

  let(:card_token) { stripe_helper.generate_card_token }

  before do
    @user = FactoryGirl.create(:user)
    @location = FactoryGirl.create(:location)
    @workshop = FactoryGirl.create(:workshop, location_id: @location.id)
  end

  describe 'GET new' do
    before do
      login_with @user

      get :new, {workshop_id: @workshop.id}
    end

    it 'assigns a workshop' do
      expect(assigns(:workshop)).to eq(Workshop.find(@workshop.id))
    end

    it 'assigns a new registration' do
      expect(assigns(:registration)).to be_a_new(Registration)
    end
  end

  describe 'POST create' do
    before do
      login_with @user
      StripeMock.start
    end
    after do
      StripeMock.stop
    end

    context 'with valid params' do
      before do
        ActionMailer::Base.deliveries = []
        post :create, workshop_id: @workshop.id,
                      registration: { 'stripe_card_token' => card_token,
                                      'plus_one' => 'false',
                                      :questionaire => valid_params }
      end

      it 'assigns a registration' do
        expect(assigns(:registration)).to be_a(Registration)
      end

      it 'associates registration with questionaire' do
        expect(assigns(:registration).questionaire).to have_attributes(comparable_params)
      end

      it 'adds plus-one value' do
        expect(assigns(:registration).plus_one).to be_falsy
      end

      it 'sends homework' do
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end

      it 'redirects to workshop path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with plus-one' do
      it 'updates attribute' do
        post :create, workshop_id: @workshop.id,
                      registration: { 'stripe_card_token' => card_token,
                                      'plus_one' => 'true',
                                      :questionaire => valid_params }
        expect(assigns(:registration).plus_one).to be_truthy
      end
    end

    context 'with invalid params' do
      let(:invalid_params) {
        { questionaire: { gar: 'bage' }}
      }

      before do

        post :create, workshop_id: @workshop.id,
                      registration: { questionaire: invalid_params }
      end

      it 'redirects to new workshop registration path' do
        expect(response).to redirect_to(new_workshop_registration_path(@workshop.id))
      end
    end

    context 'less than 3 days before workshop date' do
      it 'rejects registration' do
        @time_now = @workshop.time - 2.days
        allow(Time).to receive(:now).and_return(@time_now)

        post :create, workshop_id: @workshop.id,
                      registration: { questionaire: valid_params }
        expect(response).to redirect_to(workshops_path)

      end
    end
  end
end
