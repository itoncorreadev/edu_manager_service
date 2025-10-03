require 'rails_helper'

RSpec.describe "Subjects", type: :request do
  let(:teacher) { create(:user, :teacher) }
  let(:course) { create(:course, teacher: teacher) }
  let!(:subjects) { create_list(:subject, 3, course: course) }

  describe "GET /subjects" do
    it "returns all subjects" do
      get "/subjects", headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end

    it "filters subjects by course_id" do
      other_course = create(:course, teacher: teacher)
      get "/subjects", params: { course_id: other_course.id }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq([])
    end
  end

  describe "GET /subjects/:id" do
    it "returns a specific subject" do
      subject_ = subjects.first
      get "/subjects/#{subject_.id}", headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(subject_.id)
    end
  end

  describe "POST /subjects" do
    it "creates a subject" do
      subject_params = { subject: { name: "New Subject", course_id: course.id } }
      post "/subjects", params: subject_params, headers: auth_headers(teacher)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["name"]).to eq("New Subject")
    end
  end

  describe "PUT /subjects/:id" do
    it "updates a subject" do
      subject_ = subjects.first
      put "/subjects/#{subject_.id}", params: { subject: { name: "Updated Name" } }, headers: auth_headers(teacher)
      expect(response).to have_http_status(:ok)
      expect(subject_.reload.name).to eq("Updated Name")
    end
  end

  describe "DELETE /subjects/:id" do
    it "deletes a subject" do
      subject_ = subjects.first
      expect {
        delete "/subjects/#{subject_.id}", headers: auth_headers(teacher)
      }.to change(Subject, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
