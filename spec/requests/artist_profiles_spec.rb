require 'rails_helper'

RSpec.describe 'ArtistProfiles', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/artist_profiles'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = User.create(email: 'John@mail.com', password: 'testing')
      profile = ArtistProfile.create(name: 'john', description: 'je test mon code', zipcode: '31200', city: 'Toulouse', user_id: user.id)
      get "/artist_profiles/#{profile.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/artist_profiles/new'
      expect(response).to have_http_status(:success)
    end
  end
end
