describe 'As a user' do
  it 'can log in on the homepage' do
    visit '/'
    expect(page).to have_content("")
  end
end   
