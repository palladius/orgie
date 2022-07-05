class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :nomecitta
      t.string :sigla
      t.string :regione
      t.integer :id_pseudoid

      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
