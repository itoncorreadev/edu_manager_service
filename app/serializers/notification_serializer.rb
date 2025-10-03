class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :message, :read, :created_at
end
