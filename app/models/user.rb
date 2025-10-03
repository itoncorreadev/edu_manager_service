class User < ApplicationRecord
  enum role: { student: 0, teacher: 1, admin: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, foreign_key: :teacher_id, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
