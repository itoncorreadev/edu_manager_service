require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  let(:teacher) { create(:user, :teacher) }
  let(:course) { create(:course, teacher: teacher) }
  let(:subject_record) { create(:subject, course: course) }
  let!(:lessons) { create_list(:lesson, 3, subject: subject_record) }

  describe "GET /lessons" do
    it "returns all lessons" do
      get "/lessons", params: { subject_id: subject_record.id }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /lessons/:id" do
    it "returns a specific lesson" do
      lesson_ = lessons.first
      get "/lessons/#{lesson_.id}", headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(lesson_.id)
    end
  end

  describe "POST /lessons" do
    it "creates a lesson" do
      lesson_params = { lesson: { title: "New Lesson", content: "Content", subject_id: subject_record.id } }
      post "/lessons", params: lesson_params, headers: auth_headers(teacher)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("New Lesson")
    end
  end

  describe "PUT /lessons/:id" do
    it "updates a lesson" do
      lesson_ = lessons.first
      put "/lessons/#{lesson_.id}", params: { lesson: { title: "Updated Lesson" } }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(lesson_.reload.title).to eq("Updated Lesson")
    end
  end

  describe "DELETE /lessons/:id" do
    it "deletes a lesson" do
      lesson_ = lessons.first
      expect {
        delete "/lessons/#{lesson_.id}", headers: auth_headers(teacher)
      }.to change(Lesson, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
