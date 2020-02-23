require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I am on the new recommendations page' do
    it 'shows a field to put cuisine and mood' do
      linda = create(:user, token: '12345', refresh_token: '12345')

      visit '/recommendations/new'

      select "Italian", from: :cuisine
      select "Party", from: :mood

      click_button 'Harvest Your Beets!'

      expect(current_path).to eq('/recommendations')
    end
  end
end