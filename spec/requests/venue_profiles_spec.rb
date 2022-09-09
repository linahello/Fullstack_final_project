require 'rails_helper'

RSpec.describe "VenueProfiles", type: :request do
  describe "GET /index" do
    it "redirect when you're not log in" do
      get venue_profiles_path
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /new" do
    it "redirect when you're not log in" do
      get new_venue_profile_path
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /show" do
    it "redirect when you're not log in" do
      user = User.create(email: 'test@mail.com', password: 'jeteste')
      profile = VenueProfile.create(name: 'Bistrot', description: 'Le french bistrot guinguette', type_of_location: 'restaurant', capacity: 10, address: "123 rue de la gloire", zipcode: "07890", city: "Ville-Neuve-les-brouzoufs", user_id: user.id)
      get venue_profile_path(profile.id)
      expect(response).to have_http_status(302)
    end
  end
end
