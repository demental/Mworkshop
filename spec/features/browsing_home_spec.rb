require_relative 'features_helper'

feature 'Browsing home page' do
  scenario 'The home page WORKS !' do
    visit '/'
    expect(page).to have_title('Mworkshop')
  end
end
