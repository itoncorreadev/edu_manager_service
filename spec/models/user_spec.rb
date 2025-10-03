require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:courses).with_foreign_key('teacher_id').dependent(:destroy) }
  it { should have_many(:enrollments).dependent(:destroy) }
  it { should have_many(:assignments).dependent(:destroy) }
  it { should have_many(:submissions).dependent(:destroy) }
  it { should have_many(:notifications).dependent(:destroy) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  describe "enums" do
    it { should define_enum_for(:role).with_values(student: 0, teacher: 1, admin: 2) }
  end
end
