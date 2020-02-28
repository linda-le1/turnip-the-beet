require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the new recommendations page' do
    it 'I see a message telling me to sign back in with spotify' do
      visit "/recommendations/new"

      expect(page).to have_content "Shucks!"
      expect(page).not_to have_button "Harvest Your Beets!"
    end
  end
end