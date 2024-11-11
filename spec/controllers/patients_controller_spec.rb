require "rails_helper"

RSpec.describe PatientsController, type: :controller do
  let(:user) { create(:user) }
  let!(:patient) { create(:patient, user: user) } # Use FactoryBot if available; otherwise, replace with your fixture data

  before do
    start_session_for(user)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new patient and redirects to the patient's page" do
      expect {
        post :create, params: {patient: attributes_for(:patient)}
      }.to change(Patient, :count).by(1)

      expect(response).to redirect_to(patient_path(Patient.last))
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: {id: patient.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns a successful response" do
      get :edit, params: {id: patient.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "updates the patient and redirects to the patient's page" do
      patch :update, params: {id: patient.id, patient: {address: "Updated Address"}}
      expect(response).to redirect_to(patient_path(patient))
      expect(patient.reload.address).to eq("Updated Address")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the patient and redirects to the index page" do
      expect {
        delete :destroy, params: {id: patient.id}
      }.to change(Patient, :count).by(-1)

      expect(response).to redirect_to(patients_path)
    end
  end
end
