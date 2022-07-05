class CreaHatcolorLegacyColorefeluca < ActiveRecord::Migration
  def self.up
    create_table :colorefeluca, :primary_key => :ID_COLOREFELUCA do |t|
      t.string   :Facoltà
      t.string   :colore_default
      t.string   :città
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :colorefeluca
  end
end
