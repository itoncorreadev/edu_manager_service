require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { should belong_to(:course) }
  it { should have_many(:lessons).dependent(:destroy) }

  it { should validate_presence_of(:name) }
end
