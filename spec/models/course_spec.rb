require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to(:teacher).class_name('User') }
  it { should have_many(:subjects).dependent(:destroy) }
  it { should have_many(:enrollments).dependent(:destroy) }
  it { should have_many(:students).through(:enrollments).source(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
