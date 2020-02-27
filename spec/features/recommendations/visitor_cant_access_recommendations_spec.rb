require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the recommendations page' do
    it 'I see a message telling me I cant access the page' do
      visit "/recommendations/new"

      expect(page.status_code).to eq 404
    end
  end
end