require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :display_name }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :token }
    it { should validate_presence_of :refresh_token }
  end

  describe 'methods' do
    it 'expired_token?' do
      user = create(:user, token_expires: Time.now - 10)
      expect(user.expired_token?).to be true

      user_2 = create(:user)
      expect(user_2.expired_token?).to be false
    end
  end
end
