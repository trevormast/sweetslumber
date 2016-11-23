require 'rails_helper'

RSpec.describe QuestionairesController, type: :controller do
  before do
    @admin = FactoryGirl.create(:user, email: 'admin@web.com', admin: true)
    @user = FactoryGirl.create(:user)
    @workshop = FactoryGirl.create(:workshop)
    @questionaire = FactoryGirl.create(:questionaire)
    @registration = FactoryGirl.create(:registration,
                                       user: @user,
                                       workshop: @workshop,
                                       questionaire: @questionaire)
  end

  let(:valid_attributes) {
    {
      user_id: @user.id,
      workshop_id: @workshop.id
    }
  }

  context 'when not signed in' do
    describe 'GET #show' do
      it 'redirects to root' do
        get :show, valid_attributes
        expect(response).to be_redirect
      end
    end
  end

  context 'when signed in as user' do
    describe 'GET #show' do
      it 'redirects to root' do
        get :show, valid_attributes
        expect(response).to be_redirect
      end
    end
  end

  context 'when signed in as admin' do
    describe "GET #show" do
      before do
        login_with @admin
      end

      it "assigns the requested questionaire as @questionaire" do

        get :show, valid_attributes

        expect(assigns(:questionaire)).to eq(@questionaire)
      end
    end
  end
end
