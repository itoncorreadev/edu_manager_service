# frozen_string_literal: true

require "rails_helper"

RSpec.describe Submission, type: :model do
  it { should belong_to(:assignment) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:content) }
end
