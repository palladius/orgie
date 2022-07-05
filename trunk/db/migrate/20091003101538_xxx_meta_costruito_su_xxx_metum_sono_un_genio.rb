class XxxMetaCostruitoSuXxxMetumSonoUnGenio < ActiveRecord::Migration
  def self.up
    create_table :xxx_meta do |t|
      t.string   :nome_tabella
      t.string   :nome_campo
      t.string   :tipo_campo
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :xxx_meta
  end
end
