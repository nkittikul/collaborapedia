class ChangePrivateToBoolean < ActiveRecord::Migration
  def change
    change_column :wikis, :private, :boolean
  end
end
