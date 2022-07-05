class CreaLinksLegacyLinkzEMettiDfltFalseInSerietaCanzoni2 < ActiveRecord::Migration
  def self.up
    create_table :linkz, :primary_key => :ID_link do |t|
      t.string   :titolo
      t.integer  :id_login
      t.integer  :id_oggettoPuntato
      t.datetime :Data_creazione
      t.string   :tipo
      t.boolean  :m_battiva
      t.string   :URLlink
      t.string   :URLlinkFoto
      t.boolean  :m_bfotoattiva
      t.text     :Descrizione
      t.datetime :created_at
      t.datetime :updated_at
    end

  end

  def self.down
    
    drop_table :linkz
  end
end
