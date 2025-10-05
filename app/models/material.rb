# frozen_string_literal: true

class Material < ApplicationRecord
  belongs_to :lesson

  validates :title, :content_type, presence: true
end
