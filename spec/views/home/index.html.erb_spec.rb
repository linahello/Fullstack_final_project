require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  describe 'check the link for subscribe', type: :feature do
    it 'render sign up' do
      visit '/'
      find('.dropdown-menu').first(:link, "S'inscrire").click
      expect(page).to have_content 'Inscription'
    end
  end
end
