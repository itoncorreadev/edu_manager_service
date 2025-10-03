require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:course) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:course_id) }
end
