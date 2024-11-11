# spec/controllers/api/sessions_controller_spec.rb

require "rails_helper"

RSpec.describe Api::SessionsController, type: :controller do
  include Api::Authentication

  let(:user) { create(:user, password: "password123", password_confirmation: "password123") }
  let(:valid_headers) { {"Authorization" => "Bearer #{encode_token(user_id: user.id)}"} }

  describe "POST #create" do
    context "with valid credentials" do
      it "returns a created status and JWT token" do
        post :create, params: {email: user.email_address, password: "password123"}

        expect(response).to have_http_status(:created)
        json_response = JSON.parse(response.body)
        expect(json_response["token"]).not_to be_nil
        expect(json_response["user"]["email_address"]).to eq(user.email_address)
      end
    end

    context "with invalid credentials" do
      it "returns an unprocessable_entity status" do
        post :create, params: {email: user.email_address, password: "wrongpassword"}

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when authenticated" do
      it "logs out the user and returns no_content status" do
        request.headers.merge!(valid_headers)
        delete :destroy

        expect(response).to have_http_status(:no_content)
      end
    end

    context "when not authenticated" do
      it "returns a no_content status" do
        delete :destroy

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
