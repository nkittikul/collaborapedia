class AddPrivateToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :private, :integer
    add_index :wikis, :private
  end
end
