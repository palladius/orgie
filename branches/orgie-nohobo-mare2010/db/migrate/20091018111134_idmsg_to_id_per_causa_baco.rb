class IdmsgToIdPerCausaBaco < ActiveRecord::Migration
  def self.up
    rename_column :messaggi, :id_msg, :id
  end

  def self.down
    rename_column :messaggi, :id, :id_msg
  end
end
