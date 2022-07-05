class GiococoppieMinchiataMaHoAncheRicambiatoBacoForumMessaggiVediamoSeVa < ActiveRecord::Migration
  def self.up
    change_column :giococoppie, :m_bBacerebbe, :boolean, :default => false
    change_column :giococoppie, :m_bScoperebbe, :boolean, :default => false
    change_column :giococoppie, :m_bPrivato, :boolean, :default => false
  end

  def self.down
    change_column :giococoppie, :m_bBacerebbe, :boolean
    change_column :giococoppie, :m_bScoperebbe, :boolean
    change_column :giococoppie, :m_bPrivato, :boolean
  end
end
