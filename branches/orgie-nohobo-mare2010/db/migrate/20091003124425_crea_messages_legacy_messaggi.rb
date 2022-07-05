class CreaMessagesLegacyMessaggi < ActiveRecord::Migration
  def self.up
    create_table :messaggi, :primary_key => :id_msg do |t|
      t.string   :titolo
      t.integer  :id_login
      t.text     :messaggio
      t.datetime :data_creazione
      t.boolean  :pubblico,         :default => false
      t.integer  :id_figliodi_msg,  :default => 0
      t.integer  :id_tipo,          :default => 0
      t.datetime :created_at
      t.datetime :updated_at
    end

  end

  def self.down
    drop_table :messaggi
  end
end
