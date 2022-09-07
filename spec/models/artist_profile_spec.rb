require 'rails_helper'

RSpec.describe ArtistProfile, type: :model do
  before(:each) do
    @user = User.create(email: 'John@mail.com', password: 'testing')
    @profile_artist = ArtistProfile.create(name: 'john', description: 'je test mon code', zipcode: '31200', city: 'Toulouse', user_id: @user.id)
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@profile_artist).to be_a(ArtistProfile)
      expect(@profile_artist).to be_valid
    end

    describe '#first_name' do
      it 'should not be valid without name' do
        bad_profile_artist = ArtistProfile.create(description: 'je test mon code', zipcode: '31200', city: 'Toulouse', user_id: @user.id)
        expect(bad_profile_artist).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_profile_artist.errors.include?(:name)).to eq(true)
      end
    end
  end
end
