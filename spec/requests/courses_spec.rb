require 'rails_helper'

RSpec.describe "Courses", type: :request do
  let(:teacher) { create(:user, :teacher) }
  let!(:courses) { create_list(:course, 2, teacher: teacher) }
  let(:course) { courses.first }

  describe "GET /courses" do
    it "returns all courses for the teacher" do
      get "/courses", headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /courses/:id" do
    it "returns a specific course" do
      get "/courses/#{course.id}", headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(course.id)
    end
  end

  describe "POST /courses" do
    it "creates a course" do
      course_params = { course: { title: "Nova Curso", description: "Description" } }
      post "/courses", params: course_params, headers: auth_headers(teacher)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("Nova Curso")
    end
  end

  describe "PUT /courses/:id" do
    it "updates a course" do
      put "/courses/#{course.id}", params: { course: { title: "Atualiza Curso" } }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(course.reload.title).to eq("Atualiza Curso")
    end
  end
end
