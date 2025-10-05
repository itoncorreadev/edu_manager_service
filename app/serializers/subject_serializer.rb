# frozen_string_literal: true

class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :course_id, :created_at, :updated_at

  has_many :lessons
end
