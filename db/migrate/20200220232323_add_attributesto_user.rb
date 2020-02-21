class AddAttributestoUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :display_name, :string
    add_column :users, :refresh_token, :string
  end
end
