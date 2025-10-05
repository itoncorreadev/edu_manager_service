# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lesson, type: :model do
  it { should belong_to(:subject) }
  it { should have_many(:materials).dependent(:destroy) }
  it { should have_many(:assignments).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
