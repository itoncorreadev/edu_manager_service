class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :teacher, serializer: UserSerializer
  has_many :subjects
end
