require 'rails_helper'

RSpec.describe "Experiences", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/experiences/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/experiences/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/experiences/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
