# spec/models/patient_spec.rb

# == Schema Information
#
# Table name: patients
#
#  id                :integer          not null, primary key
#  address           :string
#  email             :string
#  emergency_type    :string
#  name              :string
#  phone             :string
#  responsible       :string
#  responsible_phone :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
# Indexes
#
#  index_patients_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Patient, type: :model do
  # Test association
  it { is_expected.to belong_to(:user).optional }


  # Test broadcasting callbacks
  describe "broadcasting callbacks" do
    let(:patient) { build(:patient) }

    it "broadcasts on create" do
      expect(patient).to receive(:broadcast_append_to).with("patients", partial: "patients/patient", locals: {patient: patient})
      patient.save!
    end

    it "broadcasts on update" do
      patient.save!
      expect(patient).to receive(:broadcast_replace_to).with("patients", target: "patient_#{patient.id}", partial: "patients/patient", locals: {patient: patient})
      patient.update!(name: "Updated Name")
    end

    it "broadcasts on destroy" do
      patient.save!
      expect(patient).to receive(:broadcast_remove_to).with("patients", target: "patient_#{patient.id}")
      patient.destroy
    end
  end
end
