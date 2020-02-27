class User < ApplicationRecord
  validates_presence_of :uid, :display_name, :token, :refresh_token

  def expired_token?
    Time.now > token_expires
  end
end
