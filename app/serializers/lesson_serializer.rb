class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :subject_id, :created_at, :updated_at

  has_many :assignments
  has_many :materials
end
