require 'rails_helper'

RSpec.describe 'profile_selection/show.html.erb', type: :view do
  describe 'it has a profile selection choice', type: :feature do
    before :each do
      User.create(email: 'John@mail.com', password: 'testing')
      visit new_user_session_path
      within('#new_user')do
        fill_in 'Adresse email', with: 'John@mail.com'
        fill_in 'Mot de passe', with: 'testing'
      end
      click_button 'Connexion'
    end

    it 'redirect to a Artist profile creation page' do
      visit '/profile_selection/show'
      click_link 'Musicien'
      expect(page).to have_content 'profil Artiste'
    end
    it 'redirect to a Venue profile creation page' do
      visit '/profile_selection/show'
      click_link 'Etablissement'
      expect(page).to have_content 'profil Établissement'
    end
  end
end
