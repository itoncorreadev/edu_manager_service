# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Enrollments", type: :request do
  let(:student) { create(:user, :student) }
  let(:teacher) { create(:user, :teacher) }
  let(:course) { create(:course, teacher: teacher) }
  let!(:enrollment) { create(:enrollment, user: student, course: course) }

  describe "GET /enrollments" do
    it "returns all enrollments for the student" do
      get "/enrollments", headers: auth_headers(student)
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to eq(1)
    end
  end

  describe "POST /enrollments" do
    it "creates an enrollment" do
      new_course = create(:course, teacher: teacher)
      enrollment_params = { enrollment: { user_id: student.id, course_id: new_course.id } }
      post "/enrollments", params: enrollment_params, headers: auth_headers(student)
      expect(response).to have_http_status(:created)
      expect(response.parsed_body["course_id"]).to eq(new_course.id)
    end
  end
end
