# frozen_string_literal: true

require "rails_helper"

RSpec.describe Assignment, type: :model do
  it { should belong_to(:lesson) }
  it { should belong_to(:user) }
  it { should have_many(:submissions).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe "enums" do
    it { should define_enum_for(:status).with_values(pending: 0, done: 1) }
  end
end
