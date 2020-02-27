require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I am on the new recommendations page', :vcr do
    it 'shows a field to put cuisine and mood' do
      user = create(:user, token: ENV['LINDA_TOKEN'], refresh_token: ENV['LINDA_REFRESH_TOKEN'])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/recommendations/new'

      expect(page).to have_select(:cuisine, text: "Italian")
      expect(page).to have_select(:cuisine, text: "Mexican")
      expect(page).to have_select(:cuisine, text: "Indian")
      expect(page).to have_select(:cuisine, text: "American")
      expect(page).to have_select(:cuisine, text: "Thai")
      expect(page).to have_select(:cuisine, text: "Chinese")
      expect(page).to have_select(:cuisine, text: "Japanese")
      expect(page).to have_select(:cuisine, text: "Latin")
      expect(page).to have_select(:cuisine, text: "Greek")
      expect(page).to have_select(:cuisine, text: "Vietnamese")
      expect(page).to have_select(:cuisine, text: "BBQ")
      expect(page).to have_select(:cuisine, text: "Korean")
      expect(page).to have_select(:cuisine, text: "French")

      expect(page).to have_select(:mood, text: "Party")
      expect(page).to have_select(:mood, text: "Chill")
      expect(page).to have_select(:mood, text: "Happy")
      expect(page).to have_select(:mood, text: "Jazzy")
      expect(page).to have_select(:mood, text: "Glum")
      expect(page).to have_select(:mood, text: "Classy")
      expect(page).to have_select(:mood, text: "Romantic")
      expect(page).to have_select(:mood, text: "Folksy")
      expect(page).to have_select(:mood, text: "Sunny")
      expect(page).to have_select(:mood, text: "Frisky")

      select "Italian", from: :cuisine
      select "Party", from: :mood

      click_button 'Harvest Your Beats!'

      expect(current_path).to eq('/recommendations')
    end
  end
end
