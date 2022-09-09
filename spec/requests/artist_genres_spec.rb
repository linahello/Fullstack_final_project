require 'rails_helper'

RSpec.describe 'ArtistGenres', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/artist_genres/new'
      expect(response).to have_http_status(:success)
    end
  end
end