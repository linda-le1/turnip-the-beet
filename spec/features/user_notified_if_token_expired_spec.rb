require 'rails_helper'

describe 'as a logged in user' do
  describe 'if my token is expired' do
    it 'shows me a notice to reauthenticate with spotify' do
      user = create(:user, token_expires: Time.now - 10)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/recommendations/new'

      expect(page).to have_content "Rotten tomatoes! Your token has expired. Please re-authenticate with Spotify"
      expect(page).not_to have_button "Harvest Your Beets!"
    end
  end
end
