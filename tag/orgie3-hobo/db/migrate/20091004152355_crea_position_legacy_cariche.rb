class CreaPositionLegacyCariche < ActiveRecord::Migration
  def self.up
    create_table :cariche, :primary_key => :ID_CARICA do |t|
      t.integer  :ID_Ordine
      t.string   :nomecarica
      t.integer  :ID_CAR_staSottoA
      t.integer  :CardinalitàMax
      t.string   :Dignità
      t.boolean  :Attiva, :default => true
      t.boolean  :HC, :default => false
      t.string   :note
      t.integer  :m_nImportanza
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :cariche
  end
end
