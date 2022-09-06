require 'rails_helper'

RSpec.describe "Abouts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/about/show"
      expect(response).to have_http_status(:success)
    end
  end

end
