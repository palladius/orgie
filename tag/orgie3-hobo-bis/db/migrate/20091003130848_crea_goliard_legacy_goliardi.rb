class CreaGoliardLegacyGoliardi < ActiveRecord::Migration
  def self.up
    create_table :goliardi, :primary_key => :ID_GOL do |t|
      t.string   :Nome
      t.string   :Cognome
      t.datetime :DataProcesso
      t.string   :Indirizzo
      t.string   :numcellulare
      t.string   :Nomegoliardico
      t.string   :Nomenobiliare
      t.integer  :ID_Ordine
      t.integer  :id_login
      t.datetime :Dataiscrizione
      t.integer  :BolliAllIscrizione
      t.string   :email
      t.integer  :contascazzi
      t.boolean  :privacy_mail, :default => false
      t.boolean  :privacy_cell, :default => false
      t.boolean  :privacy_address, :default => false
      t.string   :foto
      t.integer  :ID_FACOLTA
      t.integer  :m_nPunti
      t.boolean  :m_bIsMaschio, :default => true
      t.string   :titolo
      t.datetime :created_at
      t.datetime :updated_at
    end
   
  end

  def self.down
    drop_table :goliardi
  end
end
