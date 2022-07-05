class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :titolo
      t.integer :id_login
      t.integer :id_oggettoPuntato
      t.date :Data_creazione
      t.string :tipo
      t.boolean :m_battiva
      t.string :URLlink
      t.string :URLlinkFoto
      t.text :Descrizione
      t.boolean :m_bfotoattiva

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
