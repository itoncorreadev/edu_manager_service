class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status
  belongs_to :user, serializer: UserSerializer
  has_many :submissions
end
