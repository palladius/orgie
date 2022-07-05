class Aggiungi1a1TraUsersELegacyLoginId < ActiveRecord::Migration
  def self.up
    add_column :users, :legacy_login_id, :integer
  end

  def self.down
    remove_column :users, :legacy_login_id
  end
end
