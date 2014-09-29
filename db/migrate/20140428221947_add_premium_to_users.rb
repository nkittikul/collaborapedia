class AddPremiumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium, :integer
    add_index :users, :premium
  end
end
