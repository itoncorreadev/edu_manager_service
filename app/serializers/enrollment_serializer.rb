class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :course_id, :created_at, :updated_at
end
