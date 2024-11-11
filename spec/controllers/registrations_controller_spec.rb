require "rails_helper"

RSpec.describe RegistrationsController, type: :controller do
  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
