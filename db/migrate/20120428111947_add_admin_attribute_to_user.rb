class AddAdminAttributeToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :questions, :accepted_at, :datetime
    add_column :questions, :rejected_at, :datetime    
  end
end
