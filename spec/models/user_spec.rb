require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :display_name }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :token }
    it { should validate_presence_of :refresh_token }
  end
end
