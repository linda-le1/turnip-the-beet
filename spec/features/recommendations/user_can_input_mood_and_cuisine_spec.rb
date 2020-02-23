require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I am on the new recommendations page' do
    it 'shows a field to put cuisine and mood' do
      linda = create(:user, token: '12345', refresh_token: '12345')
      
      visit '/recommendations/new'

      find('#cuisine').click
      find('.dropdown-item', :text => 'Latin').click

      find('#mood').click
      find('.dropdown-item', :text => 'Party').click
      

      click_button 'Harvest your beets!'

      expect(current_path).to eq('/recommendations')
    end
  end
end