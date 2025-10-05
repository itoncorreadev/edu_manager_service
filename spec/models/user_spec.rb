# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should have_many(:courses).with_foreign_key("teacher_id").dependent(:destroy) }
  it { should have_many(:enrollments).dependent(:destroy) }
  it { should have_many(:assignments).dependent(:destroy) }
  it { should have_many(:submissions).dependent(:destroy) }
  it { should have_many(:notifications).dependent(:destroy) }

  it { should validate_presence_of(:email) }

  it "validates uniqueness of email" do
    existing_user = create(:user)
    user_with_duplicate_email = build(:user, email: existing_user.email)
    expect(user_with_duplicate_email).not_to be_valid
    expect(user_with_duplicate_email.errors[:email]).to include("has already been taken")
  end

  describe "enums" do
    it { should define_enum_for(:role).with_values(student: 0, teacher: 1, admin: 2) }
  end
end
