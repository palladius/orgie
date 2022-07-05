class GmsNuovoADflt < ActiveRecord::Migration
  def self.up
    change_column :gms, :m_bNuovo, :boolean, :default => true
  end

  def self.down
    change_column :gms, :m_bNuovo, :boolean
  end
end
