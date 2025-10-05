# frozen_string_literal: true

class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :message, :read, :created_at
end
