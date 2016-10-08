require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before do
    @location = FactoryGirl.create(:location)
    @workshop = FactoryGirl.create(:workshop, location_id: @location.id)
  end

  describe 'GET new' do
    before do
      login_with :user

      get :new, {workshop_id: @workshop.id}
    end

    it 'assigns a workshop' do
      expect(assigns(:workshop)).to eq(Workshop.find(@workshop.id))
    end

    it 'assigns a new registration' do
      expect(assigns(:registration)).to be_a_new(Registration)
    end
  end

  describe 'GET create' do
    before do
      login_with :user
    end

    context 'with valid params' do
      before do
        @valid_params = { baby_name: 'baby',
                          baby_dob: DateTime.now,
                          nap_location: 'crib',
                          night_location: 'crib',
                          desired_sleep_location: 'crib',
                          nap_routine: 'none',
                          night_routine: 'none',
                          naps_per_day: 2,
                          bedtime: Time.now,
                          sleep_obstacle: 'none',
                          nightwakings: 2,
                          sleep_goal: 'none',
                          referred_by: 'no one'
                        }

        post :create, workshop_id: @workshop.id,
                      registration: { questionaire: @valid_params }
      end

      it 'assigns a questionaire' do
        expect(assigns(:questionaire)).to be_a(Questionaire)
      end

      it 'assigns a registration' do
        expect(assigns(:registration)).to be_a(Registration)
      end

      it 'associates registration and questionaire' do
        expect(assigns(:registration).questionaire).to eq(assigns(:questionaire))
        expect(assigns(:questionaire).registration).to eq(assigns(:registration))
      end

      it 'redirects to workshop path' do
        expect(response).to redirect_to(workshop_path(@workshop.id))
      end
    end

    context 'with invalid params' do
      before do
        @invalid_params = { questionaire: { gar: 'bage' }}

        post :create, workshop_id: @workshop.id,
                      registration: { questionaire: @invalid_params }
      end

      it 'redirects to new workshop registration path' do
        expect(response).to redirect_to(new_workshop_registration_path(@workshop.id))
      end
    end
  end
end
