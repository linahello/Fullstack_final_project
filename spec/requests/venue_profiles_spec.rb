require 'rails_helper'

RSpec.describe "VenueProfiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/venue_profiles/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/venue_profiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/venue_profiles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/venue_profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/venue_profiles/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/venue_profiles/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
