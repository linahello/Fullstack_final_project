require 'rails_helper'

RSpec.describe "VenuesProfiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/venues_profiles/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/venues_profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/venues_profiles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/venues_profiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/venues_profiles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/venues_profiles/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
