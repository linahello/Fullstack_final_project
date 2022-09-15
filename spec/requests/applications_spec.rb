require 'rails_helper'

RSpec.describe "Applications", type: :request do

  before(:each) do
    @user = User.create(email: 'test@mail.com', password: 'jeteste')
    @profile = VenueProfile.create(name: 'Bistrot', description: 'Le french bistrot guinguette', type_of_location: 'restaurant', capacity: 10, address: "123 rue de la gloire", zipcode: "07890", city: "Ville-Neuve-les-brouzoufs", user_id: @user.id)
    @performance = Performance.create(name: "C'est un nom", description: "blabalablalblalblablalbalblalb", date: "09/23/2022, 08 : 00 PM", duration: 20, type_of_event: 0, venue_profile_id: @profile.id)
  end

  describe "GET /new" do
    it "returns http success" do
      get new_performance_application_path(@profile.id)
      expect(response).to have_http_status(:success)
    end
  end
end
