require 'rails_helper'

RSpec.describe WorkshopsController, type: :controller do

  before do
    @location = FactoryGirl.create(:location)
  end

  let(:valid_attributes) {
    {
      location_id: @location.id,
      subject: 'workshop subject',
      time: DateTime.now,
      limit: 20
    }
  }

  let(:invalid_attributes) {
    {
      limit: "not an integer"
    }
  }

  let(:valid_session) { {} }

  context 'when not signed in' do
    describe "GET #index" do
      it "assigns all workshops as @workshops" do
        workshop = Workshop.create! valid_attributes
        get :index
        expect(assigns(:workshops)).to eq([workshop])
      end
    end

    describe "GET #show" do
      it "assigns the requested workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        get :show, {id: workshop.to_param}
        expect(assigns(:workshop)).to eq(workshop)
      end
    end
  end

  context 'when signed in' do
    before do
      login_with :user
    end

    describe "GET #index" do
      it "assigns all workshops as @workshops" do
        workshop = Workshop.create! valid_attributes
        get :index
        expect(assigns(:workshops)).to eq([workshop])
      end
    end

    describe "GET #show" do
      it "assigns the requested workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        get :show, {id: workshop.to_param}
        expect(assigns(:workshop)).to eq(workshop)
      end
    end

    describe "GET #new" do
      it "assigns a new workshop as @workshop" do
        get :new, {}
        expect(assigns(:workshop)).to be_a_new(Workshop)
      end
    end

    describe "GET #edit" do
      it "assigns the requested workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        get :edit, { id: workshop.to_param }
        expect(assigns(:workshop)).to eq(workshop)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Workshop" do
          expect {
            post :create, { workshop: valid_attributes }
          }.to change(Workshop, :count).by(1)
        end

        it "assigns a newly created workshop as @workshop" do
          post :create, { workshop: valid_attributes }
          expect(assigns(:workshop)).to be_a(Workshop)
          expect(assigns(:workshop)).to be_persisted
        end

        it "redirects to the created workshop" do
          post :create, { workshop: valid_attributes }
          expect(response).to redirect_to(Workshop.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved workshop as @workshop" do
          post :create, {workshop: invalid_attributes}
          expect(assigns(:workshop)).to be_a_new(Workshop)
        end

        it "re-renders the 'new' template" do
          post :create, {workshop: invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { subject: 'new subject' }
        }

        it "updates the requested workshop" do
          workshop = Workshop.create! valid_attributes
          put :update, {id: workshop.to_param, workshop: new_attributes}
          workshop.reload
          skip("Add assertions for updated state")
        end

        it "assigns the requested workshop as @workshop" do
          workshop = Workshop.create! valid_attributes
          put :update, {id: workshop.to_param, workshop: valid_attributes}
          expect(assigns(:workshop)).to eq(workshop)
        end

        it "redirects to the workshop" do
          workshop = Workshop.create! valid_attributes
          put :update, {id: workshop.to_param, workshop: valid_attributes}
          expect(response).to redirect_to(workshop)
        end
      end

      context "with invalid params" do
        it "assigns the workshop as @workshop" do
          workshop = Workshop.create! valid_attributes
          put :update, {id: workshop.to_param, workshop: invalid_attributes}
          expect(assigns(:workshop)).to eq(workshop)
        end

        it "re-renders the 'edit' template" do
          skip('TODO')
          workshop = Workshop.create! valid_attributes
          put :update, {id: workshop.to_param, workshop: invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested workshop" do
        workshop = Workshop.create! valid_attributes
        expect {
          delete :destroy, {id: workshop.to_param}
        }.to change(Workshop, :count).by(-1)
      end

      it "redirects to the workshops list" do
        workshop = Workshop.create! valid_attributes
        delete :destroy, {id: workshop.to_param}
        expect(response).to redirect_to(workshops_url)
      end
    end
  end
end
