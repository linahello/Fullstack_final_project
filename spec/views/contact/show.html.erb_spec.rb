require 'rails_helper'

  RSpec.describe 'contact/show.html.erb', type: :view do
    describe 'check the link for contact in navbar', type: :feature do
      it 'render contact page' do
        visit '/about/show'
        click_link 'Nous contacter'
        expect(page).to have_content 'Discutons'
      end
    end
  end
  