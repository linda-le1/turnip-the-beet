require 'rails_helper'

describe 'As a visitor' do
  it 'creates a new user when logging in with Spotify for the first time', :vcr do
    
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
      :provider => 'spotify',
      :uid => '1235996540',
      :extra => {:raw_info => {display_name: 'Linda Le'}},
      :credentials => {token: ENV['LINDA_TOKEN'], refresh_token: ENV['LINDA_REFRESH_TOKEN']}
    })

    visit '/'

    click_button "Lettuce Begin (Log in with Spotify)"

    user = User.last

    expect(current_path).to eq('/recommendations/new')
    expect(page).to have_content("Welcome, #{user.display_name}!")
    expect(user.token).to eq(ENV['LINDA_TOKEN']) 
  end

  it 'does not create a user if it is a return user' do
    linda = create(:user, token: '12345', refresh_token: '12345')

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
      :provider => 'spotify',
      :uid => '1235996540',
      :extra => {:raw_info => {display_name: 'Linda Le'}},
      :credentials => {token: ENV['LINDA_TOKEN'], refresh_token: ENV['LINDA_REFRESH_TOKEN']}
    })

    visit '/'

    click_button "Lettuce Begin (Log in with Spotify)"

    expect(User.all.count).to eq(1)

    click_on 'Log Out'

    expect(current_path).to eq('/')
  end 

  it 'creates a second user' do
    linda = create(:user, token: '12345', refresh_token: '12345')
    
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
      :provider => 'spotify',
      :uid => 'jordanholtkamp',
      :extra => {:raw_info => {display_name: 'Jordan Fox Holtkamp'}},
      :credentials => {token: 'x', refresh_token: 'hi'}
    })

    visit '/'

    click_button "Lettuce Begin (Log in with Spotify)"

    expect(User.count).to eq(2)   
  end
end
