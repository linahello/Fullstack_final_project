require 'rails_helper'

RSpec.describe VenueProfile, type: :model do
  before(:each) do
    @user = User.create(email: 'test@mail.com', password: 'jeteste')
    @profile = VenueProfile.create(name: 'Bistrot', description: 'Le french bistrot guinguette', type_of_location: 'restaurant', capacity: 10, address: "123 rue de la gloire", zipcode: "07890", city: "Ville-Neuve-les-brouzoufs", user_id: @user.id)
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@profile).to be_a(VenueProfile)
      expect(@profile).to be_valid
    end

    describe 'user_id' do
      it 'should not be valid without user_id' do
        bad_profile = VenueProfile.create(name: 'Bistrot', description: 'Le french bistrot guinguette', type_of_location: 'restaurant', capacity: 10, address: "123 rue de la gloire", zipcode: "07890", city: "Ville-Neuve-les-brouzoufs")
        expect(bad_profile).not_to be_valid
      end
    end

    describe 'zipcode' do
      it 'should not create profile if the zipcode is not french zipcode' do
        invalid_profile = VenueProfile.create(name: 'Bistrot', description: 'Le french bistrot guinguette', type_of_location: 'restaurant', capacity: 10, address: "123 rue de la gloire", zipcode: "507890", city: "Ville-Neuve-les-brouzoufs", user_id: @user.id)
        expect(invalid_profile).not_to be_valid
        expect(invalid_profile.errors.include?(:zipcode)).to eq(true)
      end
    end
  end
end