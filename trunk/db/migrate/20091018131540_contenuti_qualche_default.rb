class ContenutiQualcheDefault < ActiveRecord::Migration
  def self.up
    change_column :contenuti, :m_bSerio, :boolean, :default => true
    change_column :contenuti, :m_bInAttesa, :boolean, :default => true
    change_column :contenuti, :m_battivo, :boolean, :default => true
  end

  def self.down
    change_column :contenuti, :m_bSerio, :boolean
    change_column :contenuti, :m_bInAttesa, :boolean
    change_column :contenuti, :m_battivo, :boolean
  end
end
