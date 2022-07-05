class CreataUnSaccoDiRobaDavveroScusateLaFretta < ActiveRecord::Migration
  def self.up
    create_table :query_notevoli, :primary_key => :ID do |t|
      t.string   :titolo
      t.datetime :data_creazione
      t.string   :note
      t.text     :encoded_query
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :gms, :primary_key => :id_gms do |t|
      t.datetime :data_invio
      t.boolean  :m_bNuovo
      t.integer  :idutentescrivente
      t.integer  :idutentericevente
      t.string   :messaggio
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :apparizioni_goliardi_in_foto, :primary_key => :ID_golinfoto do |t|
      t.integer  :id_foto
      t.integer  :id_gol
      t.string   :note
      t.datetime :data_commento
      t.integer  :id_utente_commento
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :foto, :primary_key => :ID_foto do |t|
      t.string   :titolo_foto
      t.string   :descrizione
      t.string   :percorso
      t.string   :data_scatto
      t.integer  :dimensione
      t.datetime :data_upload
      t.integer  :id_utente_upload
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :gestione_ordini, :primary_key => :ID_GEST_ORDINI do |t|
      t.integer  :ID_ORDINE
      t.integer  :ID_LOGIN
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :gestione_citta, :primary_key => :ID_GEST_CITTA do |t|
      t.integer  :id_login
      t.string   :città
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :facolta do |t|
      t.integer  :ID_FACOLTA
      t.string   :Facolta
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :query_notevoli
    drop_table :gms
    drop_table :apparizioni_goliardi_in_foto
    drop_table :foto
    drop_table :gestione_ordini
    drop_table :gestione_citta
    drop_table :facolta
  end
end
