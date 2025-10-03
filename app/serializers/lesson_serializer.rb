class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_many :assignments
  has_many :materials
end
