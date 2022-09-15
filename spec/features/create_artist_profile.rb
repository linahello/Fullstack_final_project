require 'rails_helper'

describe 'create an artist profile', type: :feature do

  before(:each) do
    User.create(email: 'John@mail.com', password: 'testing')
  end

  it 'should save the profile with good attributes' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Adresse email', with: 'John@mail.com'
      fill_in 'Mot de passe', with: 'testing'
    end
    click_button 'Connexion'
    click_link 'Musicien'
    within('form') do
      fill_in "Mon nom d'artiste", with: 'Test'
      fill_in 'Je me présente, en quelques mots', with: 'Bonjour je suis un artiste de talent'
      fill_in 'Code Postal', with: '31320'
      fill_in 'Ma ville', with: 'Auzeville-Tolosan'
      fill_in 'Lien de ma page Spotify', with: 'https://open.spotify.com/artist/3sDZHyMElbCQL5WwipVsJU'
    end
    click_button 'Je valide'
    click_link "J'ai terminé !"
    expect(page).to have_content 'Bienvenue sur votre espace !'
  end

  it 'should not save with wrong attributes' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Adresse email', with: 'John@mail.com'
      fill_in 'Mot de passe', with: 'testing'
    end
    click_button 'Connexion'
    click_link 'Musicien'
    within('form') do
      fill_in "Mon nom d'artiste", with: 'Test'
      fill_in 'Je me présente, en quelques mots', with: 'Bonjour je suis un artiste de talent'
      fill_in 'Code Postal', with: '320'
      fill_in 'Ma ville', with: 'Auzeville-Tolosan'
      fill_in 'Lien de ma page Spotify', with: 'https://open.spotify.com/artist/3sDZHyMElbCQL5WwipVsJU'
    end
    click_button 'Je valide'
    expect(page).to have_content 'Attention !'
  end

  it 'after you can see perform index' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Adresse email', with: 'John@mail.com'
      fill_in 'Mot de passe', with: 'testing'
    end
    click_button 'Connexion'
    click_link 'Musicien'
    within('form') do
      fill_in "Mon nom d'artiste", with: 'Test'
      fill_in 'Je me présente, en quelques mots', with: 'Bonjour je suis un artiste de talent'
      fill_in 'Code Postal', with: '31320'
      fill_in 'Ma ville', with: 'Auzeville-Tolosan'
      fill_in 'Lien de ma page Spotify', with: 'https://open.spotify.com/artist/3sDZHyMElbCQL5WwipVsJU'
    end
    click_button 'Je valide'
    click_link "J'ai terminé !"
    click_link 'Voir les évènements'
    expect(page).to have_content 'Où performer ?'
  end
end