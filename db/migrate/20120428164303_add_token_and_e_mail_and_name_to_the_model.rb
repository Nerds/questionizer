class AddTokenAndEMailAndNameToTheModel < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :email, :string
    add_column :authorizations, :token, :string    
  end
end
