require 'rails_helper'

RSpec.describe "Venuepicts", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/venuepicts/create"
      expect(response).to have_http_status(:success)
    end
  end

end
