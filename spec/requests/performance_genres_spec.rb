require 'rails_helper'

RSpec.describe "PerformanceGenres", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/performance_genres/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/performance_genres/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
