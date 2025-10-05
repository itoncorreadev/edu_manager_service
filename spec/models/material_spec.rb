# frozen_string_literal: true

require "rails_helper"

RSpec.describe Material, type: :model do
  it { should belong_to(:lesson) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content_type) }
end
