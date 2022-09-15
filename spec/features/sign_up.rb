require 'rails_helper'

describe "the signup process", type: :feature do
  
  it "signs me up" do
    # on va sur la page de création d'utilisateurs
    visit '/users/sign_up'

    # dans le formulaire des users, on remplit les données qu'il faut
    within('#new_user') do
      fill_in 'Adresse email:', with: 'user@example.com'
      fill_in 'Mot de passe', with: 'password'
      fill_in 'Confirmer votre mot de passe', with: 'password'
    end

    # clik clik
    click_button "S'inscrire"

    # la page affichée devrait afficher des bonnes nouvelles
    expect(page).to have_content 'Bienvenue, vous êtes connecté'
  end
end