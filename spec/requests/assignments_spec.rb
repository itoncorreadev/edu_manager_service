require 'rails_helper'

RSpec.describe "Assignments", type: :request do
  let(:teacher) { create(:user, :teacher) }
  let(:student) { create(:user, :student) }
  let(:course) { create(:course, teacher: teacher) }
  let(:subject_record) { create(:subject, course: course) }
  let(:lesson) { create(:lesson, subject: subject_record) }
  let!(:assignments) { create_list(:assignment, 2, lesson: lesson, user: teacher) }

  describe "GET /assignments" do
    it "returns all assignments for a lesson" do
      get "/assignments", params: { lesson_id: lesson.id }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /assignments/:id" do
    it "returns a specific assignment" do
      assignment = assignments.first
      get "/assignments/#{assignment.id}", headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(assignment.id)
    end
  end

  describe "POST /assignments" do
    it "creates an assignment" do
      assignment_params = { assignment: { title: "New Assignment", description: "Task", lesson_id: lesson.id } }
      post "/assignments", params: assignment_params, headers: auth_headers(teacher)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("New Assignment")
    end
  end

  describe "PUT /assignments/:id" do
    it "updates an assignment" do
      assignment = assignments.first
      put "/assignments/#{assignment.id}", params: { assignment: { title: "Updated Assignment" } }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(assignment.reload.title).to eq("Updated Assignment")
    end
  end

  describe "DELETE /assignments/:id" do
    it "deletes an assignment" do
      assignment = assignments.first
      expect {
        delete "/assignments/#{assignment.id}", headers: auth_headers(teacher)
      }.to change(Assignment, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
