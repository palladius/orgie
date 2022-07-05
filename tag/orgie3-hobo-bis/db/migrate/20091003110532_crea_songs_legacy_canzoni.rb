class CreaSongsLegacyCanzoni < ActiveRecord::Migration
  def self.up
    create_table :canzoni, :primary_key => :ID_canzone do |t|
      t.string   :titolo
      t.integer  :id_login
      t.datetime :Data_creazione
      t.string   :Autore
      t.boolean  :m_bSeria , :default => false
      t.text     :Corpo
      t.text     :Note
      t.string   :tipo
      t.datetime :created_at
      t.datetime :updated_at
    end
    #change_column :canzoni, :m_bSeria, :boolean, :default => false

  end

  def self.down
    #change_column :canzoni, :m_bSeria, :boolean  # inutile direi :)
    drop_table :canzoni
  end
end
