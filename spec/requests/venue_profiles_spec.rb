require 'rails_helper'

RSpec.describe "VenueProfiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/venue_profiles"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/venue_profiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      user = User.create(email: 'test@mail.com', password: 'jeteste')
      profile = VenueProfile.create(name: 'Bistrot', description: 'Le french bistrot guinguette', type_of_location: 'restaurant', capacity: 10, address: "123 rue de la gloire", zipcode: "07890", city: "Ville-Neuve-les-brouzoufs", user_id: user.id)
      get "/venue_profiles/#{profile.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
