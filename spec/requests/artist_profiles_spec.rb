require 'rails_helper'

RSpec.describe 'ArtistProfiles', type: :request do
  describe 'GET /index' do
    it "redirect when you're not log in" do
      get artist_profiles_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /show' do
    it "redirect when you're not log in" do
      user = User.create(email: 'John@mail.com', password: 'testing')
      profile = ArtistProfile.create(name: 'john', description: 'je test mon code', zipcode: '31200', city: 'Toulouse', user_id: user.id)
      get artist_profile_path(profile.id)
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /new' do
    it "redirect when you're not log in" do
      get new_artist_profile_path
      expect(response).to have_http_status(302)
    end
  end
end
