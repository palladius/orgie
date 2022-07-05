class CreaCittaLegacyRegioniECazzilloConIdErratoInXxxmeta < ActiveRecord::Migration
  def self.up
    create_table :regioni do |t|
      t.string   :nomecitta
      t.string   :sigla
      t.string   :regione
      t.integer  :id_pseudoid
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down  
    drop_table :regioni
  end
end
