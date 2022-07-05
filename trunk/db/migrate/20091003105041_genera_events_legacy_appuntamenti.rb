class GeneraEventsLegacyAppuntamenti < ActiveRecord::Migration
  def self.up
    create_table :appuntamenti, :primary_key => :ID_appuntamento do |t|
      t.integer  :id_utente
      t.string   :Nome
      t.string   :tipodiappuntamento
      t.text     :luogo
      t.datetime :data_inizio
      t.datetime :data_fine
      t.string   :città
      t.integer  :Abdicabilita
      t.integer  :recapitogoliarda1
      t.integer  :recapitogoliarda2
      t.integer  :recapitogoliarda3
      t.integer  :id_login
      t.text     :note
      t.datetime :data_invio
      t.datetime :created_at
      t.datetime :updated_at
    end
    
  end

  def self.down
    drop_table :appuntamenti
  end
end
