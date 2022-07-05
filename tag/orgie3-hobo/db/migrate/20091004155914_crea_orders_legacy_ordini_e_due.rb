class CreaOrdersLegacyOrdiniEDue < ActiveRecord::Migration
  def self.up
    create_table :ordini, :primary_key => :ID_ORD do |t|
      t.string   :Nome_veloce
      t.string   :Nome_completo
      t.string   :Sigla
      t.integer  :ID_ORD_Vassallo_di
      t.boolean  :Sovrano
      t.string   :Città
      t.datetime :datadinascita
      t.string   :Motto
      t.string   :m_fileImmagine
      t.string   :m_fileImmagineTn
      t.text     :note
      t.text     :storia
      t.integer  :id_utente_creatore
      t.datetime :data_creazione
      t.boolean  :m_bSerio
      t.string   :indirizzo
      t.string   :emailordine
      t.boolean  :m_bInSonno
      t.integer  :m_nPrecedenzaCittadina
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :ordini
  end
end
