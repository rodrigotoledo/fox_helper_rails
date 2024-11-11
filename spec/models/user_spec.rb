# spec/models/user_spec.rb
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  # Test associations
  it { is_expected.to have_many(:sessions).dependent(:destroy) }

  # Test validations
  it { is_expected.to validate_presence_of(:email_address) }
  it { is_expected.to validate_uniqueness_of(:email_address).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  # Test email normalization
  describe "email_address normalization" do
    it "downcases and strips whitespace from email_address" do
      user.email_address = "  Example@EMAIL.com  "
      user.save!
      expect(user.email_address).to eq("example@email.com")
    end
  end

  # Test password encryption (has_secure_password)
  describe "password encryption" do
    it "stores an encrypted password in password_digest" do
      user.password = "password123"
      user.valid?
      expect(user.password_digest).not_to eq("password123")
    end
  end
end
