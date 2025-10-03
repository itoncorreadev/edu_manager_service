class Assignment < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  has_many :submissions, dependent: :destroy

  enum status: { pending: 0, done: 1 }

  validates :title, presence: true
  validates :description, presence: true
end
