class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :subjects, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, source: :user

  validates :title, presence: true
  validates :description, presence: true
end
