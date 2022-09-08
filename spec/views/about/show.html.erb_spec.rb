require 'rails_helper'

RSpec.describe 'about/show.html.erb', type: :view do
  describe 'check the link for contact in navbar', type: :feature do
    it 'render about page' do
      visit '/contact/show'
      click_link 'Notre équipe'
      expect(page).to have_content 'Le vocal 15'
    end
  end
end
