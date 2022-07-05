class CreaRoleLegacyNomine < ActiveRecord::Migration
  def self.up
    create_table :nomine, :primary_key => :ID_NOMINA do |t|
      t.integer  :id_goliarda
      t.integer  :id_carica
      t.datetime :data_nomina
      t.datetime :data_fine_nomina
      t.integer  :id_goliarda_nominante
      t.string   :note
      t.integer  :eventuale_numero_progressivo
      t.integer  :id_utente_postante
      t.datetime :data_inserimento_nomina
      t.boolean  :m_bAttiva
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :nomine
  end
end
