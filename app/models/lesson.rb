class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :materials, dependent: :destroy
  has_many :assignments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
