# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  validates :content, presence: true
end
