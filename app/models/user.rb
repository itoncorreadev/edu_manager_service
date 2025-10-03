class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_authentication_token!
  
  enum role: { student: 0, teacher: 1, admin: 2 }

  has_many :courses, foreign_key: :teacher_id, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def generate_authentication_token!
    loop do
      self.authentication_token = SecureRandom.hex(20)
      break unless User.exists?(authentication_token: authentication_token)
    end

    save! if persisted?
    authentication_token
  end
end
