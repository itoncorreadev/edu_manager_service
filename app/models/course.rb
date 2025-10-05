# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :teacher, class_name: "User", inverse_of: :courses
  has_many :subjects, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, source: :user

  validates :title, presence: true
  validates :description, presence: true
end
