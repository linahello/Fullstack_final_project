require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'John@mail.com', password: 'testing')
    @user2 = User.create(email: 'John2@mail.com', password: 'testing')
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
    describe '#email' do
      it 'should not be valid without email' do
        bad_user = User.create(email: 'john', password: 'testing')
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
      it 'should not be valid without correct password' do
        bad_user = User.create(email: 'john@mail.com', password: 'tes')
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe 'user has artist profile' do
      it 'should has one artist profile' do
        @profile_artist = ArtistProfile.create(name: 'john', description: 'je test mon code', zipcode: '31200', city: 'Toulouse', user_id: @user.id)
        @user.is_artist = true
        expect(@user.is_artist).to eq(true)
        expect(@user.artist_profile.user_id).to eq(@user.id)
        expect(@user.venue_profile).to eq(nil)
      end
    end
  end
  context 'associations' do
    describe 'user has venue profile' do
      it 'should has venue profile' do
        @profile_venue = VenueProfile.create(name: 'john', description: 'je test mon code', type_of_location: 'bar', capacity: 80, address: '48 rue parla', zipcode: '31200', city: 'Toulouse', user_id: @user2.id)
        @user2.is_venue = true
        expect(@user2.is_venue).to eq(true)
        expect(@user2.venue_profile.user_id).to eq(@user2.id)
        expect(@user2.artist_profile).to eq(nil)
      end
    end
  end
end
