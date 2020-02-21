class User < ApplicationRecord
  validates_presence_of :uid, :display_name, :token, :refresh_token
end
