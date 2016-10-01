require "rails_helper"

RSpec.describe QuestionairesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/questionaires").to route_to("questionaires#index")
    end

    it "routes to #new" do
      expect(:get => "/questionaires/new").to route_to("questionaires#new")
    end

    it "routes to #show" do
      expect(:get => "/questionaires/1").to route_to("questionaires#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/questionaires/1/edit").to route_to("questionaires#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/questionaires").to route_to("questionaires#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/questionaires/1").to route_to("questionaires#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/questionaires/1").to route_to("questionaires#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/questionaires/1").to route_to("questionaires#destroy", :id => "1")
    end

  end
end
