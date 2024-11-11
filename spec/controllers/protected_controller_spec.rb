require "rails_helper"

RSpec.describe ProtectedController, type: :controller do
  let(:user) { create(:user) }

  before do
    start_session_for(user)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
