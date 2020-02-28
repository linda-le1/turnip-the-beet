require 'rails_helper'

describe 'as a logged in user' do
  describe 'if my token is expired' do
    it 'shows me a notice to reauthenticate with spotify' do
      user = create(:user, token_expires: Time.now - 10)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/recommendations/new'

      expect(page).to have_content "Shucks!"
      expect(page).not_to have_button "Harvest Your Beats!"
    end

    it 'when I click harvest my beets, Im given a notice to sign in with spotify' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/recommendations/new'
      expect(page).to have_button "Harvest Your Beats!"

      user.update(token_expires: Time.now - 10)
      click_button "Harvest Your Beets!"

      expect(page).to have_content "Shucks"
      expect(page).not_to have_button "Harvest Your Beats!"
    end
  end
end
