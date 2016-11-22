require 'rails_helper'

RSpec.describe QuestionairesController, type: :controller do

  let(:valid_attributes) {
    {
      user_id: @user.id,
      workshop_id: @workshop.id
    }
  }

  describe "GET #show" do
    before do
      login_with :user
    end

    it "assigns the requested questionaire as @questionaire" do
      @user = FactoryGirl.create(:user)
      @workshop = FactoryGirl.create(:workshop)
      @questionaire = FactoryGirl.create(:questionaire)
      @registration = FactoryGirl.create(:registration,
                                         user: @user,
                                         workshop: @workshop,
                                         questionaire: @questionaire)

      get :show, valid_attributes

      expect(assigns(:questionaire)).to eq(@questionaire)
    end
  end
end
