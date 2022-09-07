require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'John@mail.com', password: 'testing')
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
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
      it 'should not be valid without correct password' do
        bad_user = User.create(email: 'john@mail.com', password: 'tes')
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:password)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe 'artist_profile' do
      it 'should has one artist_profile' do
        @profile_artist = ArtistProfile.create(name: 'john', description: 'je test mon code', zipcode: '31200', city: 'Toulouse', user_id: @user.id)
        expect(@user.is_artist).to eq(true)
        expect(@user.is_venue).to eq(false)
      end
    end
  end
end
