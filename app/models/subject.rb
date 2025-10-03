class Subject < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy

  validates :name, presence: true
end
