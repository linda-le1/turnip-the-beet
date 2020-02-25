require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I am on the new recommendations page' do
    it 'shows a field to put cuisine and mood', :vcr do
      user = create(:user, token: ENV['JOMAH_TOKEN'], refresh_token: ENV['JOMAH_REFRESH'])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/recommendations/new'

      select "Italian", from: :cuisine
      select "Party", from: :mood

      click_button 'Harvest Your Beets!'

      expect(current_path).to eq('/recommendations')
    end
  end
end