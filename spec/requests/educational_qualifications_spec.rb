require 'rails_helper'

RSpec.describe "EducationalQualifications", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/educational_qualifications/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/educational_qualifications/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/educational_qualifications/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
