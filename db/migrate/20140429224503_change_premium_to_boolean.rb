class ChangePremiumToBoolean < ActiveRecord::Migration
  def change
    change_column :users, :premium, :boolean
  end
end
