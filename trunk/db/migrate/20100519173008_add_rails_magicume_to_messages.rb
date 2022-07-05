class AddRailsMagicumeToMessages < ActiveRecord::Migration
  def self.up
    add_column :messaggi, :created_at, :datetime
    add_column :messaggi, :updated_at, :datetime
  end

  def self.down
    remove_column :messaggi, :updated_at
    remove_column :messaggi, :created_at
  end
end
