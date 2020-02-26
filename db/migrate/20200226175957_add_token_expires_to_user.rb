class AddTokenExpiresToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token_expires, :datetime
  end
end
