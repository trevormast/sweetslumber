require 'rails_helper'

RSpec.describe "Questionaires", type: :request do
  describe "GET /questionaires" do
    it "works! (now write some real specs)" do
      get questionaires_path
      expect(response).to have_http_status(200)
    end
  end
end
