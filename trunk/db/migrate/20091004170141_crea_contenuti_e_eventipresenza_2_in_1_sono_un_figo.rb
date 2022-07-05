class CreaContenutiEEventipresenza2In1SonoUnFigo < ActiveRecord::Migration
  def self.up
    create_table :contenuti, :primary_key => :idcontenuto do |t|
      t.string   :titolo
      t.integer  :idlogin
      t.text     :contenuto
      t.datetime :datacreazione
      t.integer  :m_nLivelloSegretezza
      t.boolean  :m_battivo
      t.boolean  :m_bInAttesa
      t.string   :tipo
      t.integer  :idloginpubblicante
      t.boolean  :m_bSerio
      t.datetime :datapubblicazione
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :eventipresenze, :primary_key => :id_presenza do |t|
      t.integer  :id_utente
      t.integer  :id_appuntamento
      t.integer  :probabilita
      t.string   :commento
      t.integer  :m_nquantitotale
      t.datetime :datacreazione
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :contenuti
    drop_table :eventipresenze
  end
end
