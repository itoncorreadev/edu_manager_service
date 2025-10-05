# frozen_string_literal: true

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :teacher_id, :created_at, :updated_at

  has_many :subjects
  has_many :enrollments
end
