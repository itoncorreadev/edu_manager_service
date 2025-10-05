# frozen_string_literal: true

class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :content, :assignment_id, :user_id, :created_at, :updated_at
end
