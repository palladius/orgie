class CreatoBugmessageConTuttoGiustoEPuntatoMessageATabellaInesistenteVediamoSeVa < ActiveRecord::Migration
  def self.up
    create_table :messaggi_bacato, :primary_key => :id_msg do |t|
      t.string   :titolo, :size => 255
      t.text     :messaggio
      t.datetime :data_creazione
      t.boolean  :pubblico, :default => false
      t.integer  :id_tipo, :default => 0
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :id_figliodi_msg
      t.integer  :id_login
    end
    
    rename_column :messaggi, :id, :id_msg
    
    change_column :ordini, :Sovrano, :boolean, :default => false
    change_column :ordini, :m_bSerio, :boolean, :default => true
    change_column :ordini, :m_nPrecedenzaCittadina, :integer, :default => 10
  end

  def self.down
    rename_column :messaggi, :id_msg, :id
    
    change_column :ordini, :Sovrano, :boolean
    change_column :ordini, :m_bSerio, :boolean
    change_column :ordini, :m_nPrecedenzaCittadina, :integer
    
    drop_table :messaggi_bacato
  end
end
