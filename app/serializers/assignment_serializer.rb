# frozen_string_literal: true

class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :lesson_id, :user_id, :created_at, :updated_at

  has_many :submissions
end
